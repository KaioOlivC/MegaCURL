#!/bin/bash

echo Will register Kaio!

body='{
	"name":     "Kaio Oliveira Carvalho",
	"CPF":      "07331540505",
	"email":    "kaio.oliv.carvalho@gmail.com",
	"password": "OldPassword"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!

