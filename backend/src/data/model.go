package data

import (
	"reflect"
	"strings"
)

type IModel interface {
	GetId() string
	Validate() error
}

func GetFields(model IModel) map[string]string {
	v := reflect.ValueOf(model)
	t := v.Type()
	if t.Kind() != reflect.Struct {
		return nil
	}

	numField := t.NumField()
	fields := make(map[string]string, numField)
	v = v.Elem()

	for i := 0; i < numField; i++ {
		f := t.Field(i)
		fieldTag := f.Tag.Get("field")
		if len(fieldTag) > 0 {
			fieldProperties := strings.Split(fieldTag, ",")
			if len(fieldProperties) > 0 {
				fieldName := fieldProperties[0]
				fields[fieldName] = v.

				// omitempty := false
				// for idx, property := range fieldProperties {
				// 	if idx == 0 {
				// 		continue
				// 	}

				// 	switch property {
				// 	case "omitempty":
				// 		omitempty = true

				// 	default:
				// 		break
				// 	}
				// }
			}
		}

	}
}
