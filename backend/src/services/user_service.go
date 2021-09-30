package services

import (
	"context"
	"fmt"
	"time"

	"firebase.google.com/go/v4/auth"
	"github.com/go-playground/validator/v10"
	"github.com/tomasweg/live-configuration/api"
	"github.com/tomasweg/live-configuration/db"
	"github.com/tomasweg/live-configuration/errors"
	"github.com/tomasweg/live-configuration/forms"
	"github.com/tomasweg/live-configuration/helpers"
	models "github.com/tomasweg/live-configuration/models/identity"
)

type UserService struct {
}

func (userService *UserService) RegisterUser(signUpForm forms.UserSignUp, ctx context.Context) (account *models.Account, result api.Result) {

	// Validate sign up form
	err := helpers.Validator.Struct(signUpForm)
	if err != nil {
		errorCount := len(err.(validator.ValidationErrors))
		resErrorFields := make([]api.InvalidArgumentErrorDetailsField, errorCount)
		for i := 0; i < errorCount; i++ {
			validateError := err.(validator.ValidationErrors)[i]
			resErrorFields[i] = api.InvalidArgumentErrorDetailsField{
				Field:    validateError.Field(),
				Error:    api.InvalidArgumentErrorDetailsFieldError(validateError.Tag()),
				Metadata: validateError.Value(),
			}
		}

		return nil, api.FailedResult(api.NewResultError("Invalid arguments.", api.INVALID_ARGUMENT, api.InvalidArgumentErrorDetails{
			Fields: resErrorFields,
		}))
	}

	// Register user in Firebase Auth
	params := (&auth.UserToCreate{}).DisplayName(fmt.Sprintf("%v %v", signUpForm.FirstName, signUpForm.LastName)).Email(signUpForm.Email).Password(signUpForm.Password).Disabled(false)
	userRecord, err := db.FirebaseAuth.CreateUser(ctx, params)
	if err != nil {
		errorString := err.Error()
		fmt.Printf("Cant create user: %v\n", errorString)
		return nil, api.FailedResult(api.NewResultError("Unknown error.", api.UNKNOWN))
	}

	// If success, set custom claims
	err = db.FirebaseAuth.SetCustomUserClaims(ctx, userRecord.UID, map[string]interface{}{
		helpers.ORGANIZATION_NAME_CLAIM: signUpForm.OrganizationName,
		helpers.FULL_NAME_CLAIM:         userRecord.DisplayName,
	})

	if err != nil {
		// Rollback
		_ = db.FirebaseAuth.DeleteUser(ctx, userRecord.UID)
		return nil, api.FailedResult(api.NewResultError("Cant set claims.", api.UNKNOWN))
	}

	// Save additional data to Firestore
	createdAccount := &models.Account{
		ID:               userRecord.UID,
		FirstName:        signUpForm.FirstName,
		LastName:         signUpForm.LastName,
		Email:            signUpForm.Email,
		RegistrationDate: time.Now(),
		AccountEnabled:   true,
		OrganizationName: signUpForm.OrganizationName,
	}

	_, err = db.FirestoreDb.Collection(helpers.AppConstants.CollectionNames.UsersCollection).Doc(userRecord.UID).Set(ctx, createdAccount)
	if err != nil {
		// Rollback
		_ = db.FirebaseAuth.DeleteUser(ctx, userRecord.UID)

		fmt.Printf("error registering user: %v\n", err)
		return nil, api.FailedResult(api.NewResultError("Unknown error.", api.UNKNOWN))
	}

	return createdAccount, api.SuccessResult()
}

func (userService *UserService) FindUser(ctx context.Context, uid string) (*models.Account, api.Result) {
	snapshot, err := db.FirestoreDb.Collection(helpers.AppConstants.CollectionNames.UsersCollection).Doc(uid).Get(ctx)
	if err != nil {
		return nil, api.FailedResult(api.NewResultError("Unknown error.", api.INTERNAL_SERVER_ERROR))
	}

	if !snapshot.Exists() {
		return nil, api.FailedResult(api.NewResultError("User not found.", api.NOT_FOUND, api.ResourceErrorDetails{
			ResourceType: "user",
			ResourceName: uid,
			DefaultErrorDetails: api.DefaultErrorDetails{
				Reason: errors.UserNotFound,
			},
		}))
	}

	var account models.Account
	err = snapshot.DataTo(&account)
	if err != nil {
		return nil, api.FailedResult(api.NewResultError("Cannot parse account.", api.INTERNAL_SERVER_ERROR))
	}

	return &account, api.SuccessResult()
}
