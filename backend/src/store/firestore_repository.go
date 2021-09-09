package store

import (
	"context"
	"fmt"
	"reflect"
	"strings"

	firestore "cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"github.com/tomasweg/live-configuration/data"
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

func (repository FirestoreRepository) Insert(context context.Context, model data.IModel) (string, error) {
	if err := model.Validate(); err != nil {
		return "", err
	}

	document, _, err := repository.Db.Collection(getCollectionName(model)).Add(repository.Ctx, data.GetFields(model))
	if err != nil {
		return "", err
	}

	return document.ID, nil
}

func (repository FirestoreRepository) Update(context context.Context, model data.IModel) error {
	if err := model.Validate(); err != nil {
		return err
	}

	_, err := repository.Db.Collection(getCollectionName(model)).Doc(model.GetId()).Set(repository.Ctx, data.GetFields(model), firestore.MergeAll)
	return err
}

func (repository FirestoreRepository) FindOne(context context.Context, receiver data.IModel, id string) error {
	document, err := repository.Db.Collection(getCollectionName(receiver)).Doc(id).Get(repository.Ctx)
	if err != nil {
		return err
	}

	data := document.Data()
	for k, v := range data {
		fmt.Printf("k: %v\n", k)
		fmt.Printf("v: %v\n", v)
	}

	return nil
}

func (repository FirestoreRepository) FindAll(context context.Context, models interface{}, query Query) error {
	sql, args, err := query.ToSql(models)
	if err != nil {
		return err
	}

	fmt.Printf("Sql: %v - Args: %v", sql, args)
	return nil
	// return repository.Db.Find(models).Where(sql).Error
}

func (repository FirestoreRepository) Delete(context context.Context, model data.IModel) error {
	_, err := repository.Db.Collection(getCollectionName(model)).Doc(model.GetId()).Delete(repository.Ctx)
	return err
}

func getCollectionName(model interface{}) string {
	v, ok := model.(data.Namer)
	if !ok {
		return strings.ToLower(reflect.TypeOf(model).Name())
	}

	return v.CollectionName()
}
