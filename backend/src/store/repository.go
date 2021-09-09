package store

import (
	"context"
)

type Repository interface {
	Insert(context context.Context, model interface{}) (string, error)
	Update(context context.Context, model interface{}) error
	FindOne(context context.Context, receiver interface{}, id string) error
	FindAll(context context.Context, models []interface{}, query Query) error
	Delete(context context.Context, model interface{}) error
}

type BaseRepository struct {
}
