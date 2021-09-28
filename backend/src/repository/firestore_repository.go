package repository

import (
	"context"
	"fmt"

	firestore "cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
)

type FirestoreRepository struct {
	BaseRepository
	Db  *firestore.Client
	Ctx context.Context
}

func NewFirestoreRepository(ctx context.Context, app firebase.App) FirestoreRepository {
	client, err := app.Firestore(ctx)
	if err != nil {
		panic(fmt.Sprintf("cant get firestore client: %v", err))
	}

	return FirestoreRepository{Db: client, Ctx: ctx}
}
