package data

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
)

type INamer interface {
	CollectionName() string
}

func GetCollectionName(model interface{}) string {
	namer, ok := model.(INamer)
	if ok {
		return namer.CollectionName()
	} else {
		return fmt.Sprintf("%vs", strings.ToLower(reflect.TypeOf(model).Name()))
	}
}

func GetPrimaryKeyValue(model interface{}) (primaryKey *string, err error) {
	value := reflect.ValueOf(model)
	field := value.FieldByName("ID")
	if field.IsZero() {
		return nil, errors.New("cannot get primary key. Remember that naming conventions defines 'ID' as primary key")
	}

	id := field.String()
	return &id, nil
}
