package store

import (
	"context"
	"errors"
	"fmt"
	"reflect"
	"strings"

	sq "github.com/Masterminds/squirrel"
	"github.com/tomasweg/live-configuration/data"
)

type Repository interface {
	Insert(context context.Context, model data.IModel) (string, error)
	Update(context context.Context, model data.IModel) error
	FindOne(context context.Context, receiver data.IModel, id string) error
	FindAll(context context.Context, models []interface{}, query Query) error
	Delete(context context.Context, model data.IModel) error
}

type BaseRepository struct {
}

type Query struct {
	Filters        []QueryWhere
	Sorting        []QuerySort
	SelectedFields []string
	Page           *Pagination
}

type QuerySort struct {
	FieldName string
	Direction SortDirection
}

type QueryWhere struct {
	FieldName string
	Operator  WhereOperator
	Value     interface{}
	Nested    []QueryWhere
}

type Pagination struct {
	PageSize  uint64
	PageToken string
}

type WhereOperator int32

const (
	EQUAL                     WhereOperator = 0
	NOT_EQUAL                 WhereOperator = 1
	GREATER_THAN              WhereOperator = 2
	GREATER_THAN_OR_EQUALS_TO WhereOperator = 3
	LESS_THAN                 WhereOperator = 4
	LESS_THAN_OR_EQUALS_TO    WhereOperator = 5
	IN                        WhereOperator = 6
	NOT_IN                    WhereOperator = 7
	BETWEEN                   WhereOperator = 8
	LIKE                      WhereOperator = 9
	OR                        WhereOperator = 10
)

type SortDirection int32

const (
	ASCENDING  SortDirection = 0
	DESCENDING SortDirection = 1
)

func NewQuery() Query {
	return Query{
		Filters: make([]QueryWhere, 0),
		Sorting: make([]QuerySort, 0),
	}
}

func NewWhere(fieldName string, operator WhereOperator, value interface{}) QueryWhere {
	return QueryWhere{
		FieldName: fieldName,
		Operator:  operator,
		Value:     value,
	}
}

func (query Query) Where(fieldName string, operator WhereOperator, value interface{}) Query {
	if operator == IN || operator == NOT_IN || operator == BETWEEN {
		valueType := reflect.TypeOf(value).Kind()
		if valueType == reflect.Slice || valueType == reflect.Array {
			panic("when using IN or NOT_IN value must be of type slice or array")
		}
	}

	query.Filters = append(query.Filters, QueryWhere{
		FieldName: fieldName,
		Operator:  operator,
		Value:     value,
	})

	return query
}

func (query Query) OrWhere(filters []QueryWhere) Query {
	query.Filters = append(query.Filters, QueryWhere{
		Nested:   filters,
		Operator: OR,
	})

	return query
}

func (query Query) Sort(fieldName string, direction SortDirection) Query {
	query.Sorting = append(query.Sorting, QuerySort{
		FieldName: fieldName,
		Direction: direction,
	})

	return query
}

func (query Query) Select(fields ...string) Query {
	query.SelectedFields = fields
	return query
}

func (query Query) Paginate(pageSize uint64, pageToken string) Query {
	query.Page = &Pagination{
		PageSize:  pageSize,
		PageToken: pageToken,
	}

	return query
}

func (query Query) ToSql(model interface{}) (string, interface{}, error) {
	modelName := strings.ToLower(reflect.TypeOf(model).Name())
	if len(modelName) == 0 {
		return "", nil, errors.New("could not determine model name")
	}

	var sqlQuery sq.SelectBuilder
	if len(query.SelectedFields) == 0 {
		sqlQuery = sq.Select("*")
	} else {
		sqlQuery = sq.Select(strings.Join(query.SelectedFields, ", "))
	}

	// Apply model name
	sqlQuery = sqlQuery.From(modelName)

	// Apply filters
	for _, filter := range query.Filters {
		sqlQuery = convertWhere(filter, &sqlQuery)
	}

	// Apply sorting
	for _, sort := range query.Sorting {
		sqlQuery = sqlQuery.OrderBy(sort.FieldName)
		sqlQuery.OrderBy(fmt.Sprintf("%v %v", sort.FieldName, convertSortDirection(sort.Direction)))
	}

	// Create pagination if not found with a default page size of 100
	if query.Page == nil {
		query.Page = &Pagination{
			PageSize: 100,
		}
	}

	// Apply limit
	sqlQuery = sqlQuery.Limit(uint64(query.Page.PageSize))

	// Apply cursor pagination if any
	if len(query.Page.PageToken) != 0 {
		token, err := DecodeCursor(query.Page.PageToken)
		if err != nil {
			return "", nil, err
		}

		token.Encode()

		// for key, value := range token {

		// }
	}

	sql, args, err := sqlQuery.ToSql()
	if err != nil {
		return "", nil, err
	}

	return sql, args, nil
}

func convertWhere(where QueryWhere, builder *sq.SelectBuilder) sq.SelectBuilder {
	switch where.Operator {
	case 0:
		return builder.Where(sq.Eq{
			where.FieldName: where.Value,
		})

	case 1:
		return builder.Where(sq.NotEq{
			where.FieldName: where.Value,
		})

	case 2:
		return builder.Where(sq.Gt{
			where.FieldName: where.Value,
		})

	case 3:
		return builder.Where(sq.GtOrEq{
			where.FieldName: where.Value,
		})

	case 4:
		return builder.Where(sq.Lt{
			where.FieldName: where.Value,
		})

	case 5:
		return builder.Where(sq.LtOrEq{
			where.FieldName: where.Value,
		})

	case 6:
		return builder.Where(fmt.Sprintf("%v IN (%v)", where.FieldName, strings.Repeat("?,", len(where.Value.([]interface{})))))

	case 7:
		return builder.Where(fmt.Sprintf("%v NOT IN (%v)", where.FieldName, strings.Repeat("?,", len(where.Value.([]interface{})))))

	case 8:
		values := where.Value.([]interface{})
		return builder.Where(sq.GtOrEq{
			where.FieldName: values[0],
		}).Where(sq.LtOrEq{
			where.FieldName: values[len(values)-1],
		})

	case 9:
		return builder.Where(sq.Like{
			where.FieldName: where.Value,
		})

	case 10:
		or := sq.Or{}
		for _, subFilter := range where.Nested {
			or = append(or, convertWhere(subFilter, builder))
		}
		return builder.Where(or)

	default:
		panic(fmt.Sprintf("undefined operator %v", where.Operator))

	}
}

func convertSortDirection(direction SortDirection) string {
	if direction == ASCENDING {
		return "ASC"
	} else {
		return "DESC"
	}
}
