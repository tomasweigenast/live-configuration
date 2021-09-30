package models

import "time"

type AccessCredentials struct {
	AccessToken  string    `json:"accessToken"`
	RefreshToken string    `json:"refreshToken"`
	Expiration   time.Time `json:"expirationTime"`
}
