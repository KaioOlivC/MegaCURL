#!/bin/bash

echo Will add a participant to the last created meeting!
token=$(cat .token.txt)
minuteId=$(cat .lastMinute.txt)

body='{
	"minuteId":             "'$minuteId'",
	"candidatesToAdd":      [],
	"participantsToRemove": [],
	"candidatesToRemove":   [],
	"justification":        "Because I felt like it",
    "participantsToAdd":    [
        { "name": "Youko Minamino", "city": "Salvador", "state": "BA" }
    ]
}'

echo $body

curl -X PUT \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/meetingMinute/members | jq
echo ""
echo Done!
