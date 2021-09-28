package repository

import (
	"encoding/base64"
	"errors"
	"fmt"
	"sort"
	"strconv"
	"strings"

	"github.com/tomasweg/live-configuration/data"
)

// Represents an array of elements which is paginated
type PaginatedArray struct {
	Elements []interface{}
	NextPage PageInformation
}

// Contains information about a page
type PageInformation struct {
	PageSize         int32
	CurrentPageToken pageToken
	NextPageToken    pageToken
	PaginationType   PaginationType
}

type pageToken struct {
	SortFields     *map[string]string
	CurrentPage    *int64
	PaginationType PaginationType
}

type PaginationType int8

const (
	offset PaginationType = 0
	cursor PaginationType = 1
)

func DecodePageToken(token string) (result *pageToken, err error) {
	buffer, err := base64.StdEncoding.DecodeString(token)
	if err != nil {
		return nil, err
	}

	token = string(buffer)
	values := strings.Split(token, "_")
	valuesLength := len(values)
	if valuesLength < 2 {
		return nil, errors.New("invalid token length")
	}

	paginationType, err := strconv.ParseInt(values[0], 10, 8)

	if err != nil {
		return nil, err
	}

	if paginationType == 0 {
		currentPage, err := strconv.ParseInt(values[1], 10, 8)
		if err != nil {
			return nil, err
		}

		return &pageToken{
			PaginationType: offset,
			CurrentPage:    &currentPage,
		}, nil
	} else {
		sortByFields := values[1:valuesLength]
		sort.Strings(sortByFields)

		mappedSort := make(map[string]string)
		for _, sortField := range sortByFields {
			keyValue := strings.Split(sortField, ":")
			mappedSort[keyValue[0]] = keyValue[1]
		}

		return &pageToken{
			PaginationType: cursor,
			SortFields:     &mappedSort,
		}, nil
	}
}

func (pageToken pageToken) GetCursorField(name string) (value *string, err error) {
	rawValue, ok := (*pageToken.SortFields)[name]
	if !ok {
		return nil, fmt.Errorf("field [%v] not found", name)
	}

	return &rawValue, nil
}

// Gets a cursor field converting it to a value.
// [converter] func will always receive a string parameter.
func (pageToken pageToken) GetCursorFieldAs(name string, converter data.ConvertFromFunc) (value *interface{}, err error) {
	rawValue, err := pageToken.GetCursorField(name)
	if err != nil {
		return nil, err
	}

	output, err := converter(*rawValue)
	if err != nil {
		return nil, err
	}

	return &output, nil
}

func GetCursor(sortFields map[string]string) (result string) {
	sortFieldsLength := len(sortFields)
	cursorValues := make([]string, sortFieldsLength+1)
	cursorValues[0] = fmt.Sprint(cursor)

	keys := make([]string, sortFieldsLength)
	i := 0
	for k := range sortFields {
		keys[i] = k
		i++
	}

	sort.Strings(keys)

	i = 1
	for _, k := range keys {
		sortFieldValue := sortFields[k]
		cursorValues[i] = k + ":" + sortFieldValue
		i++
	}

	return base64.StdEncoding.EncodeToString([]byte(strings.Join(cursorValues, "_")))
}
