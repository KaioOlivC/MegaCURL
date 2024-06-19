#!/bin/bash

echo Will add a candidate to the last created meeting!
token=$(cat .token.txt)
minuteId=$(cat .lastMinute.txt)

body='{
	"minuteId":             "'$minuteId'",
	"participantsToAdd":    [],
	"participantsToRemove": [],
	"candidatesToRemove":   [],
	"justification":        "Because I felt like it",
    "candidatesToAdd":      [
        { "name": "Akina Nakamori", "city": "Salvador", "state": "BA" }
    ]
}'

curl -X PUT \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/meetingMinute/members | jq
echo ""
echo Done!

