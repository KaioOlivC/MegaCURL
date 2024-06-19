#!/bin/bash

echo Will search for meeting minutes!
token=$(cat .token.txt)

curl -X GET \
    -H "token: $token" \
    localhost:3000/meetingMinute/logs | jq

echo ""
echo Done!

