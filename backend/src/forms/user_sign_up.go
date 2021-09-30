package forms

type UserSignUp struct {
	Email            string `json:"email" validate:"required,email"`
	FirstName        string `json:"firstName" validate:"required"`
	LastName         string `json:"lastName" validate:"required"`
	OrganizationName string `json:"organizationName" validate:"required"`
	Password         string `json:"password" validate:"required"`
}
