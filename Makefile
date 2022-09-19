NETWORK = local-dev

EXECUTABLES = aws sam

VALID_EXECUTABLES := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

setup: create_network create_db create_tables start_api

destroy:
	docker stop dynamodb
	docker rm dynamodb
	docker network rm $(NETWORK)

create_network:
	docker network create $(NETWORK)

create_db:
	docker run -p 8000:8000 --network $(NETWORK) -d --name dynamodb amazon/dynamodb-local

create_tables:
	aws dynamodb create-table --cli-input-json file://$(PWD)/report-cards-table.json --endpoint-url http://localhost:8000

start_api:
	sam local start-api --docker-network $(NETWORK)

