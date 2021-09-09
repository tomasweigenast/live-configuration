package main

import (
	"time"

	"encoding/json"
	"fmt"

	"github.com/tomasweg/live-configuration/data"
)

func main() {
	// convertTo()
	convertFrom()

}

func convertFrom() {
	remoteMap := map[string]interface{}{
		"age":       64,
		"id":        "777",
		"name":      "Tómas Weigenast",
		"birthDate": time.Now(),
		"points": []int64{
			25, 36, 45, 88,
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
	data.ModelFromMap(&resultModel, remoteMap)
}

func convertTo() {
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
	}

	resultMap := data.ModelToMap(user)
	jsonResult, _ := json.MarshalIndent(resultMap, "", "    ")
	fmt.Println("MAP 1")
	fmt.Println(string(jsonResult))

	resultMap2 := data.ModelToMap(user2)
	jsonResult2, _ := json.MarshalIndent(resultMap2, "", "    ")
	fmt.Println("MAP 2")
	fmt.Println(string(jsonResult2))
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
