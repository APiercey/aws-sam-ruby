# AWS SAM RESTful App Example

This app implements a small RESTful application using API Gateway, Lambda, and DynamoDB.

You can create report cards and retrieve them through a _very_ nice API! Store the scores of your favorite subjects - which are science, math, german, english, and arts, of course!

## Starting the application

1. `make create_db` starts the DynamoDB database locally
2. `make create_tables` will create a table
3. `make start_api` will start a local version of the API

## Using the API
Once the API is running, we can use `curl` as our HTTP client

1. `curl -X POST -d '{"german":100,"english":97,"math":56,"art":3,"science":78}' localhost:3000/report_cards` will create a report card.
2. `curl localhost:3000/report_cards/{report-card-id}` will retreive one by ID
3. `curl localhost:3000/report_cards` will retreive all report cards

# About this Project
This project is for education and is provided as-is :).
