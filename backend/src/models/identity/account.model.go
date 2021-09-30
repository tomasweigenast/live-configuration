package models

import "time"

type Account struct {
	ID               string
	FirstName        string     `firestore:"firstName,omitempty"`
	LastName         string     `firestore:"lastName,omitempty"`
	Email            string     `firestore:"email,omitempty"`
	AccountEnabled   bool       `firestore:"isEnabled,omitempty"`
	OrganizationName string     `firestore:"organizationName,omitemty"`
	RegistrationDate time.Time  `firestore:"registrationDate,omitempty"`
	LastLogin        *time.Time `firestore:"lastLogin,omitempty"`
	ModifiedAt       *time.Time `firestore:"modifiedAt,omitempty"`
}

func (account Account) CollectionName() string {
	return "users"
}
