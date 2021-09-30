package models

import "time"

type Project struct {
	ID           string
	Name         string     `firestore:"name,omitempty"`
	OwnerId      string     `firestore:"ownerId,omitempty"`
	CreationDate time.Time  `firestore:"creationDate,omitempty"`
	ModifiedAt   *time.Time `firestore:"modifiedAt,omitempty"`
}

func (project Project) CollectionName() string {
	return "projects"
}
