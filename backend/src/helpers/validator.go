package helpers

import (
	"reflect"
	"strings"

	"github.com/go-playground/validator/v10"
)

var Validator *validator.Validate

func InitValidator() {
	Validator = validator.New()
	Validator.RegisterTagNameFunc(func(fld reflect.StructField) string {
		name := strings.SplitN(fld.Tag.Get("json"), ",", 2)[0]

		if name == "-" {
			return ""
		}

		return name
	})
}
