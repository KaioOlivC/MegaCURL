#!/bin/bash

echo Will remove a candidate from the last created meeting!
token=$(cat .token.txt)
minuteId=$(cat .lastMinute.txt)

read -p "Type in the candidate ID: " candidate

body='{
	"minuteId":             "'$minuteId'",
	"participantsToAdd":    [],
	"candidatesToAdd":      [],
	"participantsToRemove": [],
	"candidatesToRemove":   ["'$candidate'"],
	"justification":        "Because I felt like it"
}'

curl -X PUT \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/meetingMinute/members | jq
echo ""
echo Done!

