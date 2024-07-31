#!/bin/bash

echo Will request some electoral funding!
token=$(cat .token.txt)

body='{
    "name":                 "Akina Nakamori",
    "cnpj":                 "01234567891234",
    "currentAccount":       "Fundo Especial - FEFC", 
    "bankNumber":           "001",
    "agencyPrefix":         "0001",
    "currentAccountNumber": "012345678",
    "pixKeyType":           "cpf",
    "pixKey":               "01234567890"
}'

response=$(
    curl -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/candidate/requestElectoralFund
)
echo $response | jq
candidatureAccountId=$(echo $response | jq -r ".id")

if [ $candidatureAccountId != "null" ]; then
    echo Saving candidatureAccount id...
    echo $candidatureAccountId > .lastCandidatureAccount.txt
fi

echo Done!
