package models

import "time"

type Session struct {
	ID        string
	UserId    string     `firestore:"userId,omitempty"`
	LoginDate *time.Time `firestore:"loginDate,omitempty"`
	Active    bool       `firestore:"isActive,omitempty"`
}

func (session Session) CollectionName() string {
	return "sessions"
}
