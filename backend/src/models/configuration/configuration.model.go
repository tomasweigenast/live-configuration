package models

type ConfigurationEntryGroup struct {
	ID                      string
	Name                    string                 `firestore:"name,omitempty"`
	Description             string                 `firestore:"description,omitempty"`
	Enabled                 bool                   `firestore:"isEnabled"`
	ConfigurationEntryCount int32                  `firestore:"entryCount"`
	Metadata                map[string]interface{} `firestore:"metadata"`
}

type ConfigurationEntry struct {
	ID          string
	Key         string                  `firestore:"key,omitempty"`
	Name        string                  `firestore:"name,omitempty"`
	Description string                  `firestore:"description,omitempty"`
	Enabled     bool                    `firestore:"isEnabled,omitempty"`
	Value       ConfigurationEntryValue `firestore:"value,omitempty"`
	Metadata    map[string]interface{}  `firestore:"metadata,omitempty"`
}

type ConfigurationEntryValue struct {
	ValueType ConfigurationEntryValueType `firestore:"valueType,omitempty"`
	Value     interface{}                 `firestore:"data,omitempty"`
}

type ConfigurationEntryValueType int32

const (
	STRING    ConfigurationEntryValueType = 1
	BOOLEAN   ConfigurationEntryValueType = 2
	INTEGER   ConfigurationEntryValueType = 3
	FLOAT     ConfigurationEntryValueType = 4
	LIST      ConfigurationEntryValueType = 5
	MAP       ConfigurationEntryValueType = 6
	TIMESTAMP ConfigurationEntryValueType = 7
	DURATION  ConfigurationEntryValueType = 8
)

func (configurationEntry ConfigurationEntry) CollectionName() string {
	return "configurationEntries"
}

func (configurationEntryGroup ConfigurationEntryGroup) CollectionName() string {
	return "configurationGroups"
}
