package data

type Namer interface {
	CollectionName() string
}

type IModel interface {
	GetId() string
	Validate() error
}
