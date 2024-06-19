#!/bin/bash

echo Will search for meeting minutes!
token=$(cat .token.txt)

curl -X GET \
    -H "token: $token" \
    --data-urlencode "type=Assembleia geral" \
    --data-urlencode "date=$(date -I)" \
    --data-urlencode "city=Salvador" \
    --data-urlencode "state=BA" \
    localhost:3000/meetingMinute | jq
echo ""
echo Done!
