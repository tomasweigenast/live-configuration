package test

import (
	"errors"
	"reflect"
	"testing"
	"time"

	"github.com/tomasweg/live-configuration/model"
)

func TestEncode(t *testing.T) {
	converterRegistry := make(map[reflect.Type]model.Converter)
	converterRegistry[reflect.TypeOf(time.Time{})] = model.Converter{
		To: func(model interface{}) (output interface{}) {
			localTime := model.(time.Time)
			return localTime.Format(time.RFC3339)
		},
		From: func(model interface{}) (output interface{}, err error) {
			switch model := model.(type) {
			case string:
				return time.Parse(time.RFC3339, model)

			case time.Time:
				return model, nil

			default:
				return time.Time{}, errors.New("cant decode time with type " + reflect.TypeOf(model).String())
			}
		},
		CanDecode: func(modelType reflect.Type) (canConvert bool) {
			return modelType.Kind() == reflect.String || modelType == reflect.TypeOf(time.Time{})
		},
	}

	modelMapper := model.GetModelMapping(converterRegistry)

	user := User{
		Id:   "123",
		Name: "Tomás",
		Age:  65,
		Center: Coordinates{
			Latitude:  25,
			Longitude: 32,
		},
		Addresses: []Address{
			{
				Street: "9 de Julio",
				Coordinates: Coordinates{
					Latitude:  25.25,
					Longitude: 32.65,
				},
			},
			{
				Street: "José de San Martin",
				Coordinates: Coordinates{
					Latitude:  12.21,
					Longitude: 78.25,
				},
			},
		},
	}

	user2 := User{
		Id:   "333",
		Name: "Martin",
		Age:  12,
		Center: Coordinates{
			Latitude:  22,
			Longitude: 11,
		},
		Points:    []float32{25.21, 333, 325.15424},
		Addresses: []Address{},
		BirthDate: time.Now(),
	}

	resultMap := modelMapper.Encode(user)
	resultMap2 := modelMapper.Encode(user2)

	t.Logf("FIRST MAP: %v", resultMap)
	t.Logf("SECOND MAP: %v", resultMap2)
}

func TestDecode(t *testing.T) {
	converterRegistry := make(map[reflect.Type]model.Converter)
	converterRegistry[reflect.TypeOf(time.Time{})] = model.Converter{
		To: func(model interface{}) (output interface{}) {
			localTime := model.(time.Time)
			return localTime.Format(time.RFC3339)
		},
		From: func(model interface{}) (output interface{}, err error) {
			switch model := model.(type) {
			case string:
				return time.Parse(time.RFC3339, model)

			case time.Time:
				return model, nil

			default:
				return time.Time{}, errors.New("cant decode time with type " + reflect.TypeOf(model).String())
			}
		},
		CanDecode: func(modelType reflect.Type) (canConvert bool) {
			return modelType.Kind() == reflect.String || modelType == reflect.TypeOf(time.Time{})
		},
	}

	modelMapper := model.GetModelMapping(converterRegistry)

	remoteMap := map[string]interface{}{
		"age":       64,
		"id":        "777",
		"name":      "Tómas Weigenast",
		"birthDate": time.Now(), //"2021-09-14T12:33:16.594Z",
		"points": []float64{
			25, 36, 45, 88,
		},
		"center": map[string]float64{
			"lat":  12.65454,
			"long": 58.48415,
		},
		"addresses": []map[string]interface{}{
			{
				"street": "9 de Julio",
				"coordinates": map[string]float64{
					"lat":  12.25,
					"long": 36.11,
				},
			},
		},
	}

	resultModel := User{}
	err := modelMapper.Decode(remoteMap, &resultModel)

	if err != nil {
		t.Errorf("error: %v", err)
	}

	t.Logf("RESULT STRUCT: %v", resultModel)
}

type User struct {
	Id        string      `repository:"id"`
	Name      string      `repository:"name"`
	Age       int         `repository:"age"`
	Addresses []Address   `repository:"addresses"`
	Center    Coordinates `repository:"center"`
	Points    []float32   `repository:"points"`
	BirthDate time.Time   `repository:"birthDate"`
}

type Address struct {
	Street      string      `repository:"street"`
	Coordinates Coordinates `repository:"coordinates"`
}

type Coordinates struct {
	Latitude  float32 `repository:"lat"`
	Longitude float32 `repository:"long"`
}
