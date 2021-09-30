package api

import "github.com/gin-gonic/gin"

type Result struct {
	Success bool         `json:"success"`
	Error   *ResultError `json:"error,omitempty"`
	Data    interface{}  `json:"data,omitempty"`
}

// Creates a new ApiResponse
func NewResult(success bool, error *ResultError, data interface{}) Result {
	return Result{
		Success: success,
		Error:   error,
		Data:    data,
	}
}

// Creates a new ApiResponse which is successful.
func SuccessResult() Result {
	return NewResult(true, nil, nil)
}

// Creates a new ApiResponse which is successful and contains some data
func SuccessResultWith(data interface{}) Result {
	return NewResult(true, nil, data)
}

// Creates a new ApiResponse which is failed.
func FailedResult(err ResultError) Result {
	return NewResult(false, &err, nil)
}

// Sends a ApiResponse to gin context.
func (apiResponse Result) Send(ginContext *gin.Context) {
	if apiResponse.Success {
		ginContext.JSON(200, apiResponse)
	} else {
		ginContext.JSON(apiResponse.Error.StatusCode, apiResponse)
	}
}
