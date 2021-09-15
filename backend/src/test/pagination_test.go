package test

import (
	"fmt"
	"reflect"
	"strconv"
	"testing"
	"time"

	"github.com/tomasweg/live-configuration/repository"
)

func TestGetCursor(t *testing.T) {
	mapValues := make(map[string]string)
	mapValues["id"] = repository.RandomString(20)
	mapValues["orderDate"] = fmt.Sprint(time.Now().Unix())

	cursor := repository.GetCursor(mapValues)
	t.Logf("Generated cursor: %v", cursor)
}

func TestDecodeCursor(t *testing.T) {
	cursor := "MV9pZDoxMmExNWF3MWc1YXcxZzVfb3JkZXJEYXRlOjE2MTE2NjU3NzE="
	pageToken, err := repository.DecodePageToken(cursor)

	if err != nil {
		t.Errorf("an error ocurred: %v", err)
		t.Fail()
	}

	sortFields := *pageToken.SortFields
	t.Logf("Decoded cursor map: %v", sortFields)

	orderDate, err := pageToken.GetCursorFieldAs("orderDate", func(model interface{}) (output interface{}, err error) {
		switch date := model.(type) {
		case string:
			unix, err := strconv.ParseInt(date, 10, 32)
			if err != nil {
				return nil, err
			}

			return time.Unix(unix, 0), nil

		case *string:
			unix, err := strconv.ParseInt(*date, 10, 32)
			if err != nil {
				return nil, err
			}

			return time.Unix(unix, 0), nil

		default:
			return nil, fmt.Errorf("invalid string type. expected string or *string, but got %v", reflect.TypeOf(model))
		}

	})

	if err != nil {
		t.Errorf("an error ocurred: %v", err)
		t.Fail()
	}

	t.Logf("orderDate: %s", (*orderDate).(time.Time))
}
