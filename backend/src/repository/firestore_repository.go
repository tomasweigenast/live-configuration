package repository

import (
	"context"
	"errors"
	"fmt"

	"cloud.google.com/go/firestore"
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

func (repository FirestoreRepository) Insert(ctx context.Context, model interface{}) (id *string, err error) {
	collectionName := data.GetCollectionName(model)

	ref, _, err := repository.Db.Collection(collectionName).Add(ctx, model)
	if err != nil {
		return nil, err
	}

	return &ref.ID, err
}

func (repository FirestoreRepository) Save(ctx context.Context, model interface{}) (err error) {
	collectionName := data.GetCollectionName(model)
	primaryKey, err := data.GetPrimaryKeyValue(model)
	if err != nil {
		return err
	}

	_, err = repository.Db.Collection(collectionName).Doc(*primaryKey).Set(ctx, model)
	return err
}

func (repository FirestoreRepository) Update(ctx context.Context, entityId string, updateFunc UpdateFunc, receiver *interface{}) (err error) {
	findErr := repository.FindOne(ctx, entityId, receiver)
	if findErr != nil {
		return findErr
	}

	// Call update function
	updateFunc(receiver)

	// Save
	return repository.Save(ctx, receiver)
}

func (repository FirestoreRepository) Delete(ctx context.Context, model interface{}) (err error) {
	primaryKey, err := data.GetPrimaryKeyValue(model)
	if err != nil {
		return err
	}

	_, err = repository.Db.Collection(data.GetCollectionName(model)).Doc(*primaryKey).Delete(ctx)
	return err
}

func (repository FirestoreRepository) FindOne(ctx context.Context, id string, receiver *interface{}) (err error) {
	collectionName := data.GetCollectionName(receiver)
	snapshot, err := repository.Db.Collection(collectionName).Doc(id).Get(ctx)
	if err != nil {
		return err
	}

	if !snapshot.Exists() {
		return errors.New("entity not found")
	}

	return snapshot.DataTo(receiver)
}

func (repository FirestoreRepository) FindAll(ctx context.Context, query Query, receiver *[]interface{}) (models []interface{}, err error) {
	collectionName := data.GetCollectionName(receiver)
	firestoreQuery := repository.Db.Collection(collectionName)

	for _, order := range query.Sorting {
		if order.Direction == ASCENDING {
			firestoreQuery.OrderBy(order.FieldName, firestore.Asc)
		} else {
			firestoreQuery.OrderBy(order.FieldName, firestore.Desc)
		}
	}

	for _, filter := range query.Filters {
		op, err := getFirestoreOperator(filter.Operator)
		if err != nil {
			return nil, err
		}

		firestoreQuery.Where(filter.FieldName, op, filter.Value)
	}

	if query.Page == nil {
		query.Page = &PageInformation{
			PageSize:       100,
			PaginationType: cursor,
		}
	}

	if query.SelectedFields != nil {
		firestoreQuery.Select(query.SelectedFields)
	}
}

func getFirestoreOperator(op WhereOperator) (operator string, err error) {
	switch op {
	case EQUAL:
		return "==", nil

	case NOT_EQUAL:
		return "!=", nil

	case GREATER_THAN:
		return ">", nil

	case GREATER_THAN_OR_EQUALS_TO:
		return ">=", nil

	case LESS_THAN:
		return "<", nil

	case LESS_THAN_OR_EQUALS_TO:
		return "<=", nil

	case CONTAINS:
		return "array-contains", nil

	case CONTAINS_ANY:
		return "array-contains-any", nil

	case IN:
		return "in", nil

	case NOT_IN:
		return "not-in", nil

	default:
		return "", errors.New(fmt.Sprintf("unsupported operator: %v", op))
	}
}
