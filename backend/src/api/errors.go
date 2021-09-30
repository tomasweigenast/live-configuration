package api

// Represents an error in a [ApiResponse].
type ResultError struct {
	// A description which helps the developer to know what is going wrong.
	Message string `json:"description"`

	// The error description that identifies the http status code.
	Status string `json:"status"`

	// The http status code. This is not included in the response.
	StatusCode int `json:"-"`

	// A list of details that can help identifiying the error.
	Details []ResultErrorDetails `json:"details,omitempty"`
}

//go:generate stringer -type=ResultStatusCode
type ResultStatusCode int32

const (
	OK                    ResultStatusCode = 200
	NOT_FOUND             ResultStatusCode = 404
	INVALID_ARGUMENT      ResultStatusCode = 400
	UNAUTHORIZED          ResultStatusCode = 401
	PERMISSION_DENIED     ResultStatusCode = 403
	ALREADY_EXISTS        ResultStatusCode = 409
	RESOURCE_EXHAUSTED    ResultStatusCode = 410
	UNKNOWN               ResultStatusCode = 500
	INTERNAL_SERVER_ERROR ResultStatusCode = 500
)

// A base error details interface.
// Error fields must follow Google error code conventions: https://cloud.google.com/apis/design/errors#error_payloads
type ResultErrorDetails interface{}

// A struct which contains default error fields.
type DefaultErrorDetails struct {
	ResultErrorDetails `json:"-"`
	Reason             string            `json:"reason"`
	Metadata           map[string]string `json:"metadata,omitempty"`
}

// An error fired when trying to access a resource. Contains information about it.
type ResourceErrorDetails struct {
	DefaultErrorDetails

	// The type of resource being accessed.
	ResourceType string `json:"resourceType"`

	// The name of the resource to access.
	ResourceName string `json:"resourceName"`

	// The owner of the resource. Can be empty.
	Owner string `json:"owner,omitempty"`

	// A description of the error. Can be empty.
	Description string `json:"description,omitempty"`
}

// An error thrown when an invalid argument is received in a request.
type InvalidArgumentErrorDetails struct {
	DefaultErrorDetails

	// The list of fields that failed.
	Fields []InvalidArgumentErrorDetailsField `json:"fields"`
}

// Contains information about a field that failed on [InvalidArgumentErrorDetails]
type InvalidArgumentErrorDetailsField struct {

	// The name of the field that failed.
	Field string `json:"field"`

	// The error that thrown this error.
	Error InvalidArgumentErrorDetailsFieldError `json:"error,omitempty"`

	// Any information about the field.
	Metadata interface{} `json:"metadata,omitempty"`
}

type InvalidArgumentErrorDetailsFieldError string

const (
	REQUIRED            InvalidArgumentErrorDetailsFieldError = "required"
	MIN_LENGTH_REQUIRED InvalidArgumentErrorDetailsFieldError = "min-length-required"
	MAX_LENGTH_EXCEEDED InvalidArgumentErrorDetailsFieldError = "max-length-exceeded"
	REGEX_NOT_MATCH     InvalidArgumentErrorDetailsFieldError = "regex-not-match"
)

// Creates a new ApiResponseError
func NewResultError(message string, status ResultStatusCode, details ...ResultErrorDetails) ResultError {
	return ResultError{
		Message:    message,
		Status:     status.String(),
		StatusCode: int(status),
		Details:    details,
	}
}
