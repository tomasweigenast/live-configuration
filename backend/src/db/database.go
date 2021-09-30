package db

import (
	"context"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
)

var FirebaseAuth *auth.Client
var FirestoreDb *firestore.Client

func InitDb() {
	firebaseApp, err := firebase.NewApp(context.Background(), nil)
	if err != nil {
		panic(err)
	}

	FirebaseAuth, err = firebaseApp.Auth(context.Background())
	if err != nil {
		panic(err)
	}

	FirestoreDb, err = firebaseApp.Firestore(context.Background())
	if err != nil {
		panic(err)
	}

}
