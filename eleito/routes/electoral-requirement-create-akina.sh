#!/bin/bash

echo Will create an electoral requirement!
token=$(cat .token.txt)
candidatureAccountId=$(cat .lastCandidatureAccount.txt)

body='{
    "accountingName":        "Akina Nakamori", 
    "accountingObservation": "Campaign observation", 
    "accountingPhone":       "72987654321", 
    "address":               "Rua Pink, 1", 
    "birthday":              "1965-07-13",
    "campaignCnpj":          "012345678901234", 
    "candidateName":         "Akina Nakamori", 
    "candidatureAccountId":  "'$candidatureAccountId'",
    "cpf":                   "01234567890", 
    "disputedPost":          "Presidente", 
    "email":                 "akina@jpop.co.jp", 
    "landline":              "71387654321", 
    "name":                  "Akina Nakamori", 
    "phone":                 "71987654321", 
    "race":                  "Amarelo(a)", 
    "sex":                   "Feminino", 
    "uf":                    "BA", 
    "value":                 50000.00
}'

response=$(
    curl -X POST \
    -H "token: $token" \
    -H "Content-Type: multipart/form-data" \
    -F "electoralRequirement=@akina-bikini.jpg" \
    -F "electoralRequirement=@akina-bubbles.jpg" \
    -F "data={ \"data\": $body }" \
    localhost:3000/candidate/createElectoralRequirement
)
echo $response | jq

requirementId=$(echo $response | jq -r ".id")
if [ $requirementId != "null" ]; then
    echo Saving requirement id...
    echo $requirementId > .lastElectoralRequiment.txt
fi

echo Done!
