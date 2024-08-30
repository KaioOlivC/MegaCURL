#!/bin/bash

echo Will get the pink Toyota debt report!
token=$(cat .token.txt)

body='{
    "byVehicle":   { "licensePlate": "JKX1981" },
    "byViolation": {
        "occurrenceDate":    "2020-10-10",
        "actingInstitution": "SET",
        "type":              "Running at 300km/s",
        "status":            "processing"
    }
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/report/violation | jq

echo Done!
