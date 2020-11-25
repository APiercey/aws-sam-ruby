NETWORK = local-dev

create_db:
	docker run -p 8000:8000 --network $(NETWORK) --name dynamodb amazon/dynamodb-local 

destroy_db:
	docker rm dynamodb

create_tables:
	aws dynamodb create-table --cli-input-json file://$(PWD)/report-cards-table.json --endpoint-url http://localhost:8000


start_api:
	sam local start-api --docker-network $(NETWORK)

