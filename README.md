# ProtoMolva

Эта директория содержит прото и ген файлы для молвы).

## Команда генерации

```
protoc --experimental_allow_proto3_optional \
--proto_path=proto/crm/ \
--go_out=go/gen/crm \
--go_opt=paths=source_relative \
--go-grpc_out=go/gen/crm \
--go-grpc_opt=paths=source_relative \
crm.proto
