GOOGLEAPIS_PROTO_PATH = ./contrib/googleapis/
TIMESTAMP_PROTO_PATH = ./contrib/protobuf/
PROTO_PATH_AGENT = ./proto/agent/
PROTO_PATH_DISTR = ./proto/distributor/
PROTO_PATH_CRM = ./proto/crm/
PROTO_PATH_NOTIFICATIONS = ./proto/notifications
GEN_DIR_AGENT = ./go/gen/agent/ 
GEN_DIR_DISTR = ./go/gen/distributor/
GEN_DIR_CRM = ./go/gen/crm/
GEN_DIR_NOTIFICATIONS = ./go/gen/notifications/
GO_FLAGS = --experimental_allow_proto3_optional --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative

.PHONY : gen_agent
gen_agent:
	protoc \
	$(GO_FLAGS) \
	--proto_path=$(GOOGLEAPIS_PROTO_PATH) \
	--proto_path=$(TIMESTAMP_PROTO_PATH) \
	--proto_path=$(PROTO_PATH_AGENT) \
	--go_out=$(GEN_DIR_AGENT) \
	--go-grpc_out=$(GEN_DIR_AGENT) \
	agent.proto

.PHONY : gen_distributor
gen_distributor:
	protoc \
	$(GO_FLAGS) \
	--proto_path=$(GOOGLEAPIS_PROTO_PATH) \
	--proto_path=$(TIMESTAMP_PROTO_PATH) \
	--proto_path=$(PROTO_PATH_DISTR) \
	--go_out=$(GEN_DIR_DISTR) \
	--go-grpc_out=$(GEN_DIR_DISTR) \
	distributor.proto

.PHONY : gen_crm
gen_crm:
	protoc \
	$(GO_FLAGS) \
	--proto_path=$(PROTO_PATH_CRM) \
	--go_out=$(GEN_DIR_CRM) \
	--go-grpc_out=$(GEN_DIR_CRM) \
	crm.proto

.PHONY : gen_notifications
gen_notifications:
	protoc \
	$(GO_FLAGS) \
	--proto_path=$(PROTO_PATH_NOTIFICATIONS) \
	--go_out=$(GEN_DIR_NOTIFICATIONS) \
	--go-grpc_out=$(GEN_DIR_NOTIFICATIONS) \
	notifications.proto

.PHONY : gen
gen: gen_agent gen_distributor gen_crm gen_notifications

.PHONY : clean
clean:
	rm -rf $(GEN_DIR_AGENT) $(GEN_DIR_DISTR) $(GEN_DIR_CRM) $(GEN_DIR_NOTIFICATIONS)