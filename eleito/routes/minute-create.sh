#!/bin/bash

echo Will create a new meeting minute!
token=$(cat .token.txt)
content="Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! Akina-chan! "

body='{
    "title": "Idols meeting",
    "type":  "Assembleia geral",
    "city":  "Salvador",
    "state": "BA",
    "participants": [
        { "name": "Chisato Moritaka",   "city": "Salvador", "state": "BA" },
        { "name": "Hiroko Yakushimaru", "city": "Salvador", "state": "BA" },
        { "name": "Akemi Ishii",        "city": "Salvador", "state": "BA" },
        { "name": "Mari Iijima",        "city": "Salvador", "state": "BA" }
    ],
    "candidates": [
        { "name": "Akina Nakamori", "city": "Salvador", "state": "BA" }
    ],
    "content": "'$content'" 
}'

response=$(
    curl -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/meetingMinute
)
echo $response | jq
minuteId=$(echo $response | jq -r ".id")
echo $minuteId

if [ $minuteId != "null" ]; then
    echo Saving minute id...
    echo $minuteId > .lastMinute.txt
fi

echo Done!
