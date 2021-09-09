package store

import (
	"context"
	"encoding/json"
	"fmt"
	"reflect"
	"strings"

	"github.com/tomasweg/live-configuration/data"
)

type Repository interface {
	Insert(context context.Context, model interface{}) (string, error)
	Update(context context.Context, model interface{}) error
	FindOne(context context.Context, receiver interface{}, id string) error
	FindAll(context context.Context, models []interface{}, query Query) error
	Delete(context context.Context, model interface{}) error
}

type BaseRepository struct {
}

var fieldsByTag = make(map[reflect.Type]*data.ModelFieldCollection)

func buildFieldsByTagMap(model interface{}) *data.ModelFieldCollection {
	t := reflect.TypeOf(model)
	if t.Kind() == reflect.Ptr {
		t = t.Elem()
	}

	if t.Kind() != reflect.Struct {
		panic("bad type: " + t.Kind().String())
	}

	var fieldsArray []data.ModelField
	numField := t.NumField()
	if fieldsByTag[t] == nil {
		fieldsArray = make([]data.ModelField, numField)
	}

	for i := 0; i < numField; i++ {
		f := t.Field(i)
		tagName := strings.Split(f.Tag.Get("repository"), ",")[0]
		if tagName == "" || tagName == "-" {
			continue
		}

		fieldsArray[i] = data.ModelField{
			StructField:     f,
			StructFieldName: f.Name,
			TagName:         tagName,
		}
	}

	collection := &data.ModelFieldCollection{
		Fields:     fieldsArray,
		FieldCount: len(fieldsArray),
	}
	fieldsByTag[t] = collection

	return collection
}

func getModelFieldCollection(value reflect.Value) data.ModelFieldCollection {
	fields, ok := fieldsByTag[value.Type()]
	if !ok {
		fields = buildFieldsByTagMap(value.Interface())
	}

	return *fields
}

func getModelFieldCollectionByType(t reflect.Type) data.ModelFieldCollection {
	fields, ok := fieldsByTag[t]
	if !ok {
		typeInstance := reflect.New(t).Elem().Interface()
		fields = buildFieldsByTagMap(typeInstance)
	}

	return *fields
}

func ModelToMap(model interface{}) map[string]interface{} {
	val := reflect.ValueOf(model)
	fieldCollection := getModelFieldCollection(val)

	if val.Kind() == reflect.Ptr {
		val = val.Elem()
	}

	resultMap := make(map[string]interface{}, fieldCollection.FieldCount)
	for _, v := range fieldCollection.Fields {
		if !v.StructField.IsExported() {
			continue
		}

		field := val.FieldByIndex(v.StructField.Index)

		var fieldValue interface{}
		switch field.Kind() {
		case reflect.Struct:
			fieldValue = ModelToMap(field.Interface())

		case reflect.Array, reflect.Slice:
			arrayLength := field.Len()
			arrayValue := make([]interface{}, arrayLength)
			for i := 0; i < arrayLength; i++ {
				value := field.Index(i)
				arrayValue[i] = ModelToMap(value.Interface())
			}

			fieldValue = arrayValue

		default:
			fieldValue = field.Interface()
		}

		resultMap[v.TagName] = fieldValue
	}

	return resultMap
}

func ModelFromMap(model interface{}, data map[string]interface{}) {
	val := reflect.ValueOf(model)
	fieldCollection := getModelFieldCollection(val)

	val = val.Elem()

	for _, v := range fieldCollection.Fields {
		if !v.StructField.IsExported() {
			continue
		}

		dataField := data[v.TagName]
		modelField := val.FieldByIndex(v.StructField.Index)

		if !modelField.IsValid() || !modelField.CanSet() {
			return
		}

		setModelValue(&modelField, dataField)
	}
}

func setModelValue(modelField *reflect.Value, dataField interface{}) {
	fmt.Printf("Field kind: %v - type: %v - data field type %v\n", modelField.Kind(), modelField.Type(), reflect.TypeOf(dataField).Kind())
	switch modelField.Kind() {
	case reflect.String:
		modelField.SetString(dataField.(string))

	case reflect.Bool:
		modelField.SetBool(dataField.(bool))

	case reflect.Int, reflect.Int16, reflect.Int32, reflect.Int64:
		modelField.SetInt(reflect.ValueOf(dataField).Int())

	case reflect.Uint, reflect.Uint16, reflect.Uint32, reflect.Uint64:
		modelField.SetUint(reflect.ValueOf(dataField).Uint())

	case reflect.Float32, reflect.Float64:
		modelField.SetFloat(reflect.ValueOf(dataField).Float())

	case reflect.Complex64, reflect.Complex128:
		modelField.SetComplex(reflect.ValueOf(dataField).Complex())

	case reflect.Slice, reflect.Array:
		dataArray := reflect.ValueOf(dataField)
		arrayValue := reflect.MakeSlice(modelField.Type(), 1, dataArray.Cap())
		for i := 0; i < dataArray.Len(); i++ {
			element := dataArray.Index(i)
			arrayElementType := modelField.Type().Elem()
			arrayValue = reflect.Append(arrayValue, convertBack(arrayElementType, element))
		}

		modelField.Set(reflect.ValueOf(modelField.Type()))

	case reflect.Map:
		dataMap := dataField.(map[interface{}]interface{})
		mapValue := reflect.MakeMap(reflect.TypeOf(dataField))
		if dataField == nil {
			modelField.Set(reflect.MakeMapWithSize(modelField.Type(), len(dataMap)))
		} else {
			for k, v := range dataMap {
				mapValue.SetMapIndex(reflect.ValueOf(k), reflect.ValueOf(v))
			}
		}

		modelField.Set(mapValue)

	case reflect.Struct:
		modelField.Set(reflect.ValueOf(ModelToMap(dataField.(map[interface{}]interface{}))))

	default:
		panic(fmt.Sprintf("cant convert %v", modelField.Kind()))
	}
}

func convertBack(baseType reflect.Type, element reflect.Value) reflect.Value {
	baseTypeFieldCollection := getModelFieldCollectionByType(baseType)
	switch element.Kind() {
	case reflect.Map:
		// elementMap := element.Interface().(map[string]interface{})
		newMap := make(map[string]interface{})
		for _, key := range element.MapKeys() {
			value := element.MapIndex(key)
			field := baseTypeFieldCollection.GetByTag(key.String())
			fmt.Printf("value: %v - type: %v - kind: %v\n", value, value.Type(), value.Kind())

			if field.StructField.Type.Kind() != reflect.Struct {
				newMap[field.StructFieldName] = value.Interface()
			} else {
				newMap[field.StructFieldName] = convertBack(field.StructField.Type, value)
			}
		}

		j, _ := json.Marshal(newMap)
		fmt.Println(string(j))
		return reflect.ValueOf(newMap).Convert(baseType)

	default:
		return element
	}
}
