package controllers

import (
	"github.com/gin-gonic/gin"
	"github.com/tomasweg/live-configuration/api"
	"github.com/tomasweg/live-configuration/forms"
	"github.com/tomasweg/live-configuration/services"
)

type UsersController struct {
	userService services.UserService
}

func (h *UsersController) Register(c *gin.Context) {
	var signUpForm forms.UserSignUp
	if c.ShouldBindJSON(&signUpForm) != nil {
		api.FailedResult(api.NewResultError("Empty body.", api.INVALID_ARGUMENT)).Send(c)
		c.Abort()
		return
	}

	account, result := h.userService.RegisterUser(signUpForm, c.Request.Context())

	if !result.Success {
		result.Send(c)
		c.Abort()
		return
	}

	api.SuccessResultWith(account).Send(c)
}

func (h *UsersController) Get(c *gin.Context) {
	account, result := h.userService.FindUser(c.Request.Context(), "")
	if !result.Success {
		result.Send(c)
		c.Abort()
		return
	}

	api.SuccessResultWith(account).Send(c)
}
