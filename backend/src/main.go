package main

import (
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/tomasweg/live-configuration/controllers"
	"github.com/tomasweg/live-configuration/db"
	"github.com/tomasweg/live-configuration/helpers"
)

func init() {
	fmt.Println("app initialized")
	err := godotenv.Load()
	if err != nil {
		log.Fatal("error loading .env file")
	}

	helpers.InitValidator()
	helpers.InitConstants()
	db.InitDb()
}

func main() {
	router := gin.Default()

	router.NoRoute(func(c *gin.Context) {
		c.JSON(404, gin.H{
			"message": "not found",
			"error":   "404",
		})
	})

	v1 := router.Group("/internal/v1")
	{
		health := v1.Group("health")
		{
			healthController := new(controllers.HealthController)
			health.GET("/", healthController.Default)
			health.GET("/force-error", healthController.TestError)
		}

		users := v1.Group("users")
		{
			usersController := new(controllers.UsersController)
			users.POST("/", usersController.Register)
		}
	}

	router.Run(":8989")
}
