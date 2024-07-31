#!/bin/bash

echo Will upload an electoral requirement PDF!
token=$(cat .token.txt)
requirementId=$(cat .lastElectoralRequiment.txt)

response=$(
    curl -X POST \
    -H "token: $token" \
    -H "Content-Type: multipart/form-data" \
    -F "pdf=@moranbong-vocals.png" \
    -F "data={ \"data\": { \"requirementId\": \"$requirementId\" }}" \
    localhost:3000/candidate/storeElectoralRequirementPDF
)
echo $response | jq

echo Done!
