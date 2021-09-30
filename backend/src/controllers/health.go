package controllers

import (
	"github.com/gin-gonic/gin"
	"github.com/tomasweg/live-configuration/api"
)

type HealthController struct{}

func (h *HealthController) Default(c *gin.Context) {
	api.SuccessResult().Send(c)
}

func (h *HealthController) TestError(c *gin.Context) {
	api.FailedResult(api.NewResultError("health error test is working perfectly,", api.NOT_FOUND, api.ResourceErrorDetails{
		ResourceType: "users",
		ResourceName: "users/123",
		Description:  "user cannot be found.",
		Owner:        "123",
	})).Send(c)
}
