package store

import (
	"context"
	"fmt"

	firestore "cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"github.com/tomasweg/live-configuration/data"
)

type FirestoreRepository struct {
	BaseRepository
	Db *firestore.Client
}

func NewFirestoreRepository(ctx context.Context, app firebase.App) FirestoreRepository {
	client, err := app.Firestore(ctx)
	if(err != nil) {
		panic(fmt.Sprintf("cant get firestore client: %v", err))
	}

	return FirestoreRepository{Db: client}
}

func (repository FirestoreRepository) Insert(context context.Context, model data.IModel) (string, error) {
	if err := model.Validate(); err != nil {
		return "", err
	}

	if err := repository.Db.Create(model).Error; err != nil {
		return "", err
	}

	return model.GetId(), nil
}

func (repository FirestoreRepository) Update(context context.Context, model data.IModel) error {
	if err := model.Validate(); err != nil {
		return err
	}

	return repository.Db.Save(model).Error
}

func (repository FirestoreRepository) FindOne(context context.Context, receiver data.IModel, id string) error {
	return repository.Db.First(receiver, id).Error
}

func (repository FirestoreRepository) FindAll(context context.Context, models interface{}, query Query) error {
	sql, args, err := query.ToSql(models)
	if err != nil {
		return err
	}

	fmt.Printf("Args: %v", args)

	return repository.Db.Find(models).Where(sql).Error
}

func (repository FirestoreRepository) Delete(context context.Context, model data.IModel) error {
	return repository.Db.Delete(model).Error
}
