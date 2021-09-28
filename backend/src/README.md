## Mapping of fields  
Tag names must contain "repository" key, and then the name of the field. If the "repository" tag is omitted, the field is ignored.  


### Using with SqlRepository
If models will be stored using `SqlRepository`, another tag can be used, which is "sqlType".  
"sqlType" indicates the database type used when encoding the value. If omitted, the default field type will be used, but it can cause errors
on sql databases which does not support jsons or arrays.

#### Sql Types
- array
    > When using it, indicates the field should be serialized as an array and the database driver supports it.

- json
    > The field will be encoded using json before saving. Some sql databases supports JSONs, if the driver allows it, SqlRepository will save it
    > using the driver JSON type, otherwise, before saving, it will be encoded to json and saved as an string. 

