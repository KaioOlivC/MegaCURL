#!/bin/bash

echo Will remove a participant from the last created meeting!
token=$(cat .token.txt)
minuteId=$(cat .lastMinute.txt)

read -p "Type in the participant ID: " participant

body='{
	"minuteId":             "'$minuteId'",
	"participantsToAdd":    [],
	"candidatesToAdd":      [],
	"participantsToRemove": ["'$participant'"],
	"candidatesToRemove":   [],
	"justification":        "Because I felt like it"
}'

echo $body

curl -X PUT \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/meetingMinute/members | jq
echo ""
echo Done!
