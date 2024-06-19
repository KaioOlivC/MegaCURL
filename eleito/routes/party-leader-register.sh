#!/bin/bash

echo Will register Su-hyang as a party leader!

body='{
    "name":                "Jong Su-hyang", 
    "nickname":            "Su-hye", 
    "email":               "jong_su_hyang@dprk.gov.kp", 
    "phone":               "123456789", 
    "password":            "Akina1*pass",
    "endOfTermDate":       "2026-01-01",
    "role":                "president",
    "permission":          "national",
    "statePermission":     "BA",
    "municipalPermission": "Salvador"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/party-leader/register | jq
echo ""
echo Done!
