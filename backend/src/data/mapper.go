package data

import (
	"fmt"
	"reflect"
	"strings"

	"github.com/tomasweg/live-configuration/utils"
)

type ConverterRegistry map[reflect.Type]Converter

type ModelField struct {
	StructField     reflect.StructField
	StructFieldName string
	TagName         string
	IsPrimaryKey    bool
	Tags            []string
	OmitEmpty       bool
}

type ModelDescription struct {
	Fields     []ModelField
	FieldCount int
	Name       string
}

func (collection ModelDescription) GetFieldByTag(tag string) *ModelField {
	for _, v := range collection.Fields {
		if v.TagName == tag {
			return &v
		}
	}

	return nil
}

func (collection ModelDescription) GetFieldByName(fieldName string) *ModelField {
	for _, v := range collection.Fields {
		if v.StructFieldName == fieldName {
			return &v
		}
	}

	return nil
}

// Encodes a model
func Encode(model interface{}, converterRegistry ConverterRegistry) map[string]interface{} {
	// Get modelValue with reflect
	modelValue := reflect.ValueOf(model)
	if modelValue.Kind() == reflect.Ptr {
		modelValue = modelValue.Elem()
	}

	output := encodeStruct(modelValue, converterRegistry)
	return output
}

func encodeValue(value reflect.Value, converterRegistry ConverterRegistry) interface{} {
	// First check for custom converters
	converter, ok := converterRegistry[value.Type()]

	// If a custom converter if found, use it and return
	if ok {
		fmt.Printf("Using converter with type [%v]\n", value.Type())
		return converter.To(value.Interface())
	}

	// Otherwise, convert normally
	switch value.Kind() {
	case reflect.Struct:
		return encodeStruct(value, converterRegistry)

	case reflect.Array, reflect.Slice:
		return encodeArray(value, converterRegistry)

	case reflect.Map:
		return encodeMap(value, converterRegistry)

	default:
		return value.Interface()
	}
}

func encodeArray(array reflect.Value, converterRegistry ConverterRegistry) []interface{} {
	// Get array length
	arrayLength := array.Len()

	// Create a new array
	output := make([]interface{}, arrayLength)

	for i := 0; i < arrayLength; i++ {
		value := array.Index(i)
		output[i] = encodeValue(value, converterRegistry)
	}

	return output
}

func encodeMap(mapValue reflect.Value, converterRegistry ConverterRegistry) map[interface{}]interface{} {
	output := make(map[interface{}]interface{})
	for _, key := range mapValue.MapKeys() {
		mapValue := mapValue.MapIndex(key)
		output[encodeValue(key, converterRegistry)] = encodeValue(mapValue, converterRegistry)
	}

	return output
}

func encodeStruct(value reflect.Value, converterRegistry ConverterRegistry) map[string]interface{} {
	output := make(map[string]interface{})

	// Get type
	modelType := value.Type()

	// Get ModelDescription for type
	modelDescription := findModelDescription(modelType)

	// Iterate over all fieelds
	for _, field := range modelDescription.Fields {
		fieldValue := value.FieldByName(field.StructFieldName)

		// If its a pointer, unpack
		if fieldValue.Kind() == reflect.Ptr {
			fieldValue = fieldValue.Elem()
		}

		if !fieldValue.IsValid() || fieldValue.IsZero() || !fieldValue.CanInterface() {
			continue
		}

		// Map field
		output[field.TagName] = encodeValue(fieldValue, converterRegistry)
	}

	return output
}

// Decodes a model
func Decode(mappedValue map[string]interface{}, model interface{}, converterRegistry ConverterRegistry) (err error) {
	// Get model type
	modelValue := reflect.ValueOf(model)

	// If its a pointer, unpack
	if modelValue.Kind() == reflect.Ptr {
		modelValue = modelValue.Elem()
	}

	return decodeStruct(reflect.ValueOf(mappedValue), modelValue)
}

func decodeStruct(mappedValue reflect.Value, modelValue reflect.Value) (err error) {
	// Get ModelDescription for type
	modelDescription := findModelDescription(modelValue.Type())
	for _, field := range modelDescription.Fields {
		// Get model field
		modelField := modelValue.FieldByName(field.StructFieldName)

		// If the field is valid and can set, extract value from map
		if modelField.IsValid() && modelField.CanSet() {
			/*
				On a map like this: { "name": "Tomas", "values": [5, 7, 6, 5, 2] }
				- rawValue is "Tomas" or "[5, 7, 6, 5, 2]"
				- modelField is "name" or "values"
			*/

			// Get value from mappedValue
			rawValue := mappedValue.MapIndex(reflect.ValueOf(field.TagName))

			// Skip if the value is not found
			if rawValue.IsZero() {
				continue
			}

			fmt.Printf("Converting field [%v] type [%v] raw value [%s]\n", field.StructField.Name, modelField.Type(), rawValue.Type())
			newValue := decodeValue(rawValue, modelField.Type())
			if newValue.CanConvert(modelField.Type()) {
				newValue = newValue.Convert(modelField.Type())
			}
			modelField.Set(newValue)
		}
	}

	return nil
}

func decodeValue(rawValue reflect.Value, modelFieldType reflect.Type) reflect.Value {
	switch modelFieldType.Kind() {
	case reflect.Array, reflect.Slice:
		// Treat rawValue as its a array or slice
		arrayLength := rawValue.Len()
		newArray := reflect.MakeSlice(modelFieldType, rawValue.Len(), rawValue.Cap())
		for i := 0; i < arrayLength; i++ {
			elem := rawValue.Index(i)

			// Always unpack pointers
			if elem.Kind() == reflect.Ptr {
				elem = elem.Elem()
			}

			newArray.Index(i).Set(decodeValue(elem, elem.Type()))
		}

		return newArray

	case reflect.Map:
		newMap := reflect.MakeMap(modelFieldType)
		for _, key := range rawValue.MapKeys() {
			value := rawValue.MapIndex(key)
			newMap.SetMapIndex(decodeValue(key, newMap.Type().Key()), decodeValue(value, newMap.Type().Elem()))
		}

		return newMap

	case reflect.Struct:
		structInstance := reflect.New(modelFieldType)
		decodeStruct(rawValue, structInstance)
		return structInstance

	default:
		fmt.Println("Decoding field as raw value.")
		return rawValue
	}
}

// A local cache to store all created ModelDescription
var fieldsByTag = make(map[reflect.Type]ModelDescription)

// Creates a ModelDescription for a type
func buildModelDescriptionFor(t reflect.Type) ModelDescription {
	fmt.Printf("Creating ModelDescription for type %v\n", t.Name())

	if t.Kind() == reflect.Ptr {
		t = t.Elem()
	}

	if t.Kind() != reflect.Struct {
		panic("bad type: " + t.Kind().String())
	}

	numField := t.NumField()
	foundFields := make([]ModelField, numField)

	for i := 0; i < numField; i++ {
		field := t.Field(i)
		if !field.IsExported() {
			continue
		}

		tags := strings.Split(field.Tag.Get("repository"), ",")
		if utils.ArrayContains(tags, "-") {
			continue
		}

		tagName := tags[0]
		tags = utils.ArrayRemove(tags, 0)

		foundFields[i] = ModelField{
			StructField:     field,
			StructFieldName: field.Name,
			TagName:         tagName,
			IsPrimaryKey:    utils.ArrayContains(tags, "primaryKey"),
			OmitEmpty:       utils.ArrayContains(tags, "omitempty"),
			Tags:            tags,
		}
	}

	description := ModelDescription{
		Fields:     foundFields,
		FieldCount: len(foundFields),
		Name:       t.Name(),
	}

	fieldsByTag[t] = description
	return description
}

// Gets or creates a ModelDescription by type
func findModelDescription(t reflect.Type) ModelDescription {
	modelDescription, ok := fieldsByTag[t]
	if !ok {
		modelDescription = buildModelDescriptionFor(t)
	}

	return modelDescription
}
