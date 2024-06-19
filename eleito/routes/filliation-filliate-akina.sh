#!/bin/bash

echo Will filliate Akina!
token=$(cat .token.txt)

body='{
	"addressAdditionalDetails": "Pink Building, Ap. 17",
	"addressNumber":            "1",
	"addressReferencePoints":   "Pink Music Studio",
	"areaCode":                 "71",
	"birthday":                 "1965-07-13",
	"city":                     "Salvador",
	"CPF":                      "01234567890",
	"electoralDocumentCity":    "Salvador",
	"electoralDocumentNumber":  "12345",
	"electoralDocumentSection": "1",
	"electoralDocumentState":   "BA",
	"electoralDocumentZone":    "1",
	"email":                    "akina@jpop.co.jp",
	"motherName":               "Noriko Nakamori",
	"name":                     "Akina Nakamori",
	"nationality":              "Japonesa",
	"neighborhood":             "Imbuí",
	"occupation":               "Cantor E Compositor",
	"phoneNumber":              "987654321",
	"phoneType":                "Pessoal",
	"race":                     "Amarelo(a)",
	"RG":                       "09876543210",
	"sex":                      "Feminino",
	"socialName":               "Utahime Densetsu",
	"state":                    "BA",
	"thoroughfare":             "Pink",
	"thoroughfareType":         "Rua",
	"zipCode":                  "12345678"
}'

curl -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/filliated/register | jq
echo ""
echo Done!
