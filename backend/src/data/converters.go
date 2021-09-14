package data

import "reflect"

type ConvertToFunc func(model interface{}) (output interface{})
type ConvertFromFunc func(model interface{}) (output interface{}, err error)

// Represents a function that returns a boolean indicating if the type can be converted to its original type.
type CanDecodeFunc func(modelType reflect.Type) (canConvert bool)

type Converter struct {
	To        ConvertToFunc
	From      ConvertFromFunc
	CanDecode CanDecodeFunc
}
