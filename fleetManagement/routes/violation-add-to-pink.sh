#!/bin/bash

echo Will add a violation to the pink Toyota!
token=$(cat .token.txt)
vehicleId=$(cat .vehicleId.txt)
driverId=$(cat .driverId.txt)

body='{
    "vehicleId":                   "'$vehicleId'",
    "personId":                    "'$driverId'",
    "occurenceDate":               "2020-10-10",
    "type":                        "Running at 300km/s",
    "AITNumber":                   "'$(date +%s)'",
    "actingInstitution":           "SET",
    "score":                       5,
    "value":                       15.99,
    "driverJustificationDeadline": "2025-10-10"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/violation | jq

echo Done!
