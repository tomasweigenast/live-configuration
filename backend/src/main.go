package main

import (
	"fmt"
	"reflect"
)

func main() {
	var users []User
	name := getType(&users)
	fmt.Print(name)
}

type User struct {
	Id   string
	Name string
	Age  int
}

func getType(myvar interface{}) string {
	return reflect.TypeOf(myvar).Name()
}
