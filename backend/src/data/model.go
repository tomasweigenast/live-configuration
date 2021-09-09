package data

import (
	"encoding/json"
	"fmt"
	"reflect"
	"strings"

	"github.com/tomasweg/live-configuration/utils"
)

type Namer interface {
	CollectionName() string
}

type Converter interface {
	ToMap() map[string]interface{}
}

type IModel interface {
	GetId() string
	Validate() error
}

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

func ModelToMap(model interface{}) map[string]interface{} {
	val := reflect.ValueOf(model)
	fieldDescription := getModelDescriptionByValue(val)

	fmt.Printf("Mapping model: %v with ModelDescription: %v (field count: %v)\n", val.Type().Name(), fieldDescription.Name, fieldDescription.FieldCount)

	if val.Kind() == reflect.Ptr {
		fmt.Println("Unpacking pointer...")
		val = val.Elem()
	}

	resultMap := make(map[string]interface{}, fieldDescription.FieldCount)
	for _, v := range fieldDescription.Fields {
		if !v.StructField.IsExported() {
			continue
		}

		field := val.FieldByName(v.StructFieldName)

		var fieldValue interface{}
		switch field.Kind() {
		case reflect.Struct:
			fieldValue = ModelToMap(field.Interface())

		case reflect.Array, reflect.Slice:
			arrayLength := field.Len()
			arrayValue := make([]interface{}, arrayLength)
			for i := 0; i < arrayLength; i++ {
				value := field.Index(i)
				if value.Type().Kind() == reflect.Struct {
					arrayValue[i] = ModelToMap(value.Interface())
				} else {
					arrayValue[i] = value.Interface()
				}
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
	val := reflect.ValueOf(model).Elem()
	fieldCollection := getModelDescriptionByValue(val)

	for _, v := range fieldCollection.Fields {
		data := data[v.TagName]
		modelField := val.FieldByName(v.StructField.Name)

		if !modelField.IsValid() || !modelField.CanSet() {
			return
		}

		setModelValue(&modelField, data)
	}
}

var fieldsByTag = make(map[reflect.Type]*ModelDescription)

func buildModelDescriptionFor(t reflect.Type) *ModelDescription {
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

		// if field.Type.Kind() == reflect.Struct {
		// 	buildModelDescriptionFor(field.Type)
		// }

		foundFields[i] = ModelField{
			StructField:     field,
			StructFieldName: field.Name,
			TagName:         tagName,
			IsPrimaryKey:    utils.ArrayContains(tags, "primaryKey"),
			OmitEmpty:       utils.ArrayContains(tags, "omitempty"),
			Tags:            tags,
		}
	}

	description := &ModelDescription{
		Fields:     foundFields,
		FieldCount: len(foundFields),
		Name:       t.Name(),
	}

	fieldsByTag[t] = description
	return description
}

func getModelDescriptionByValue(value reflect.Value) ModelDescription {
	fields, ok := fieldsByTag[value.Type()]
	if !ok {
		fmt.Printf("DescriptionModel for type %v not found. Creating...\n", value.Type().Name())
		fields = buildModelDescriptionFor(value.Type())
	}

	return *fields
}

func getModelDescriptionByType(t reflect.Type) ModelDescription {
	fields, ok := fieldsByTag[t]
	if !ok {
		fields = buildModelDescriptionFor(t)
	}

	return *fields
}

func setModelValue(modelField *reflect.Value, dataField interface{}) {
	fmt.Printf("Setting field value to [%v]. Field kind: %v - type: %v - data field type: %v\n", dataField, modelField.Kind(), modelField.Type(), reflect.TypeOf(dataField).Kind())
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
		arrayValue := reflect.MakeSlice(modelField.Type(), 0, dataArray.Cap())
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
	baseTypeFieldCollection := getModelDescriptionByType(baseType)
	switch element.Kind() {
	case reflect.Map:
		// elementMap := element.Interface().(map[string]interface{})
		newMap := make(map[string]interface{})
		for _, key := range element.MapKeys() {
			value := element.MapIndex(key)
			field := baseTypeFieldCollection.GetFieldByTag(key.String())
			fmt.Printf("value: %v - type: %v - kind: %v\n", value, value.Type(), value.Kind())

			switch field.StructField.Type.Kind() {
			case reflect.Struct, reflect.Map:
				fmt.Printf("Converting back a [%v] - kind [%v] with value [%v] of type [%v]\n", field.StructField.Type.Name(), field.StructField.Type.Kind(), value.Interface(), value.Type())
				newMap[field.StructFieldName] = convertBack(field.StructField.Type, reflect.ValueOf(value.Interface()))

			default:
				newMap[field.StructFieldName] = value.Interface()
			}
		}

		// j, _ := json.Marshal(newMap)
		return reflect.ValueOf(unmarshalType(newMap, baseType))
		// return reflect.ValueOf()

	default:
		return element
	}
}

func unmarshalType(data map[string]interface{}, modelType reflect.Type) interface{} {
	modelInstance := reflect.New(modelType).Elem()
	for k, v := range data {
		field := modelInstance.FieldByName(k)
		if field.CanSet() {
			value := reflect.ValueOf(v)
			j, _ := json.Marshal(value.Interface())
			fmt.Printf("Value to set: %v [kind: %v] - Field type: %v - Field name: %v\n", string(j), reflect.TypeOf(value.Interface()), field.Type(), k)
			value = reflect.ValueOf(value.Interface()).Convert(field.Type())
			field.Set(value)
			// if field.Kind() != reflect.Struct {
			// } else {
			// 	field.Set(value)
			// }
		}
	}

	return modelInstance
}
