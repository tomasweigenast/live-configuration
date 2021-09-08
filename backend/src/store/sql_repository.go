package store

import (
	"context"
	"fmt"

	"github.com/tomasweg/live-configuration/data"
	"gorm.io/gorm"
)

type SqlRepository struct {
	BaseRepository
	Db *gorm.DB
}

func NewSqlRepository(db *gorm.DB) SqlRepository {
	return SqlRepository{Db: db}
}

func (repository *SqlRepository) Initialize(args ...interface{}) {
	if len(args) == 0 {
		panic("*gorm.DB must be supplied for initialization")
	}

	if _, ok := args[0].(*gorm.DB); !ok {
		panic("THe first arg must be *gorm.DB")
	}

	repository.Db = args[0].(*gorm.DB)
}
func (repository SqlRepository) Insert(context context.Context, model data.IModel) (string, error) {
	if err := model.Validate(); err != nil {
		return "", err
	}

	if err := repository.Db.Create(model).Error; err != nil {
		return "", err
	}

	return model.GetId(), nil
}

func (repository SqlRepository) Update(context context.Context, model data.IModel) error {
	if err := model.Validate(); err != nil {
		return err
	}

	return repository.Db.Save(model).Error
}

func (repository SqlRepository) FindOne(context context.Context, receiver data.IModel, id string) error {
	return repository.Db.First(receiver, id).Error
}

func (repository SqlRepository) FindAll(context context.Context, models interface{}, query Query) error {
	sql, args, err := query.ToSql(models)
	if err != nil {
		return err
	}

	fmt.Printf("Args: %v", args)

	return repository.Db.Find(models).Where(sql).Error
}

func (repository SqlRepository) Delete(context context.Context, model data.IModel) error {
	return repository.Db.Delete(model).Error
}
