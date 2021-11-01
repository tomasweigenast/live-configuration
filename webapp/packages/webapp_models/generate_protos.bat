echo Generating protos...
set GOOGLE_PROTO_PATH=C:\dev\protoc-3.18.0-win64\include\google\protobuf

protoc --proto_path=./../../../protos/ --dart_out=./lib/src/models/protos configuration_entry.proto
protoc --proto_path=./../../../protos/ --dart_out=./lib/src/models/protos identity.proto
protoc --proto_path=./../../../protos/ --dart_out=./lib/src/models/protos project.proto
protoc --dart_out=./lib/src/models/protos "%GOOGLE_PROTO_PATH%\any.proto"
protoc --dart_out=./lib/src/models/protos "%GOOGLE_PROTO_PATH%\timestamp.proto"
protoc --dart_out=./lib/src/models/protos "%GOOGLE_PROTO_PATH%\duration.proto"
protoc --dart_out=./lib/src/models/protos "%GOOGLE_PROTO_PATH%\wrappers.proto"
protoc --dart_out=./lib/src/models/protos "%GOOGLE_PROTO_PATH%\empty.proto"

pause