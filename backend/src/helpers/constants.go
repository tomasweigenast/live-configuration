package helpers

const (
	ORGANIZATION_NAME_CLAIM string = "org_name"
	FULL_NAME_CLAIM         string = "full_name"
)

type appConstants struct {
	CollectionNames collectionNames
}

type collectionNames struct {
	UsersCollection string
}

var AppConstants appConstants

func InitConstants() {
	AppConstants = appConstants{
		CollectionNames: collectionNames{
			UsersCollection: "users",
		},
	}
}
