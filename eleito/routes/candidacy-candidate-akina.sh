#!/bin/bash

echo Will make Akina a candidate!
token=$(cat .token.txt)

body='{
    "hasBeenOnPublicPost6MoAgo":                 false,
    "runningName":                               "Akina-chan",
    "ballotNumber":                              "1",
    "campaignWebsite":                           "akina.co.jp",
    "isTryingReelection":                        true,
    "disputedPost":                              "Presidente",
    "electionCity":                              "Salvador",
    "electionState":                             "BA",
    "electionYear":                              2024,
    "name":                                      "Akina Nakamori",
    "socialName":                                "Utahime Densetsu",
    "electoralDocumentNumber":                   "12345",
    "CPF":                                       "01234567890",
    "RG":                                        "01234567890",
    "emittingInstitutionIdentificationDocument": "SSP",
    "emittingStateIdentificationDocument":       "BA",
    "birthday":                                  "1965-07-13",
    "birthState":                                "BA",
    "birthCity":                                 "Salvador",
    "nationality":                               "Japonesa",
    "sex":                                       "Feminino",
    "race":                                      "Amarelo(a)",
    "scholarshipLevel":                          "Superior completo",
    "maritalStatus":                             "Solteiro(a)",
    "occupation":                                "Cantor E Compositor",
    "currentElectoralPost":                      "Presidente",
    "previousElections": [{ 
        "year":  2022, 
        "post":  "Presidente", 
        "city":  "Salvador", 
        "state": "BA" 
    }],
    "properties": [{ 
        "type":        "Jóia", 
        "description": "Pink Gem", 
        "value":       100000.00 
    }],
    "phones": [{
        "type":     "Pessoal",
        "number":   "987654321",
        "areaCode": "72"
    }],
    "addresses": [{ 
        "addressType":      "Atribuição de CNPJ",
        "city":             "Salvador", 
        "details":          "Pink Building, Ap. 17", 
        "neighborhood":     "Imbuí", 
        "number":           "1", 
        "referencePoints":  "Pink Music Studio", 
        "state":            "BA", 
        "thoroughfare":     "Pink", 
        "thoroughfareType": "Rua", 
        "zipCode":          "12345678" 
    }]
}'

curl -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/candidate/register | jq
echo ""
echo Done!
