package main

import (
	"time"

	"github.com/tomasweg/live-configuration/store"
)

func main() {
	// user := User{
	// 	Id:   "123",
	// 	Name: "Tomás",
	// 	Age:  65,
	// 	Center: Coordinates{
	// 		Latitude:  25,
	// 		Longitude: 32,
	// 	},
	// 	Addresses: []Address{
	// 		{
	// 			Street: "9 de Julio",
	// 			Coordinates: Coordinates{
	// 				Latitude:  25.25,
	// 				Longitude: 32.65,
	// 			},
	// 		},
	// 		{
	// 			Street: "José de San Martin",
	// 			Coordinates: Coordinates{
	// 				Latitude:  12.21,
	// 				Longitude: 78.25,
	// 			},
	// 		},
	// 	},
	// }

	// resultMap := store.ModelToMap(user)
	// jsonResult, _ := json.MarshalIndent(resultMap, "", "    ")
	// fmt.Print(string(jsonResult))

	remoteMap := map[string]interface{}{
		"age":       64,
		"id":        "777",
		"name":      "Tómas Weigenast",
		"birthDate": time.Now().Format("20060102150405"),
		"points": []int{
			25, 36, 45, 88,
		},
		"addresses": []map[string]interface{}{
			{
				"street": "9 de Julio",
				"coordinates": map[string]float32{
					"lat":  12.25,
					"long": 36.11,
				},
			},
		},
	}

	resultModel := &User{}
	store.ModelFromMap(resultModel, remoteMap)
}

type User struct {
	Id        string      `repository:"id"`
	Name      string      `repository:"name"`
	Age       int         `repository:"age"`
	Addresses []Address   `repository:"addresses"`
	Center    Coordinates `repository:"center"`
	Points    []int       `repository:"points"`
}

type Address struct {
	Street      string      `repository:"street"`
	Coordinates Coordinates `repository:"coordinates"`
}

type Coordinates struct {
	Latitude  float32 `repository:"lat"`
	Longitude float64 `repository:"long"`
}
