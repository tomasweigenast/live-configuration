package repository

import (
	"context"
)

type UpdateFunc func(model interface{})

type Repository interface {
	// Inserts a single entity and returns its id.
	Insert(ctx context.Context, model interface{}) (id *string, err error)

	// Saves an already created entity.
	Save(ctx context.Context, model interface{}) (err error)

	// Updates an entity. This functions requires the repository to read the entity first.
	Update(ctx context.Context, entityId string, updateFunc UpdateFunc, receiver *interface{}) (err error)

	// Finds one entity
	FindOne(ctx context.Context, id string, receiver *interface{}) (err error)

	// Finds all the entities that matches a query
	FindAll(ctx context.Context, query Query, model interface{}) (models []interface{}, err error)

	// Deletes an entity
	Delete(ctx context.Context, model interface{}) (err error)
}

type BaseRepository struct {
}
