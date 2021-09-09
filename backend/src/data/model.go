package data

import (
	"reflect"
	"strings"
)

type Namer interface {
	CollectionName() string
}

type IModel interface {
	GetId() string
	Validate() error
}

type ModelField struct {
	StructField     reflect.StructField
	StructFieldName string
	TagName         string
}

type ModelFieldCollection struct {
	Fields     []ModelField
	FieldCount int
}

func (collection ModelFieldCollection) GetByTag(tag string) *ModelField {
	for _, v := range collection.Fields {
		if v.TagName == tag {
			return &v
		}
	}

	return nil
}

func (collection ModelFieldCollection) GetByFieldName(fieldName string) *ModelField {
	for _, v := range collection.Fields {
		if v.StructFieldName == fieldName {
			return &v
		}
	}

	return nil
}

func GetFields(model interface{}) map[string]interface{} {
	v := reflect.ValueOf(model)
	t := v.Type()
	if t.Kind() != reflect.Struct {
		return nil
	}

	numField := t.NumField()
	fields := make(map[string]interface{}, numField)
	v = v.Elem()

	for i := 0; i < numField; i++ {
		f := t.Field(i)
		if !f.IsExported() {
			continue
		}

		fieldValue := v.Field(i)
		key, omit, _ := readTag(f)

		if omit && fieldValue.String() == "" {
			continue
		}

		fields[key] = fieldValue.Interface()
	}

	return fields
}

func GetId(model interface{}) string {
	v := reflect.ValueOf(model)
	t := v.Type()

	v = v.Elem()

	for i := 0; i < t.NumField(); i++ {
		f := t.Field(i)
		if !f.IsExported() {
			continue
		}

		_, _, primaryKey := readTag(f)
		if strings.ToLower(f.Name) == "id" || primaryKey {
			return v.String()
		}
	}

	panic("model does not have a primary key defined.")
}

func readTag(f reflect.StructField) (string, bool, bool) {
	val, ok := f.Tag.Lookup("repository")
	if !ok {
		return f.Name, false, false
	}

	opts := strings.Split(val, ",")
	omit := false
	primaryKey := false

	if contains(opts, "omitempty") {
		omit = true
	}

	if contains(opts, "primaryKey") {
		primaryKey = true
	}

	return opts[0], omit, primaryKey
}

func contains(array []string, value string) bool {
	for _, v := range array {
		if v == value {
			return true
		}
	}

	return false
}

func getValue(v reflect.Value) interface{} {
	switch v.Kind() {
	case reflect.Bool:
		return v.Bool()

	case reflect.String:
		return v.String()

	case reflect.Int, reflect.Int8, reflect.Int16, reflect.Int32, reflect.Int64:
		return v.Int()

	case reflect.Uint, reflect.Uint8, reflect.Uint16, reflect.Uint32, reflect.Uint64:
		return v.Uint()

	case reflect.Float32, reflect.Float64:
		return v.Float()

	case reflect.Complex64, reflect.Complex128:
		return v.Complex()

	default:
		return v.Interface()
	}
}
