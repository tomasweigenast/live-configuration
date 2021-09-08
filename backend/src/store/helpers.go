package store

import (
	b64 "encoding/base64"
	"fmt"
	"strings"
)

type ResultCursor map[string]string

func (cursor ResultCursor) Encode() string {
	pairs := make([]string, len(cursor))
	for key, value := range cursor {
		pairs = append(pairs, fmt.Sprintf("%v=%v", key, value))
	}

	encodedPairs := strings.Join(pairs, ",")
	return b64.StdEncoding.EncodeToString([]byte(encodedPairs))
}

func DecodeCursor(cursor string) (ResultCursor, error) {
	data, err := b64.StdEncoding.DecodeString(cursor)
	if err != nil {
		return nil, err
	}

	cursor = string(data)
	pairs := strings.Split(cursor, ",")
	resultMap := make(map[string]string, len(pairs))

	for _, value := range pairs {
		pair := strings.Split(value, "=")
		resultMap[pair[0]] = pair[1]
	}

	return resultMap, nil
}
