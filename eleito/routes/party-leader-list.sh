#!/bin/bash

echo Will list all party leaders!
leaderToken=$(cat .leaderToken.txt)

# List federal leaders
echo \#FEDERAL:
response=$(curl -X GET \
    -H "token: $leaderToken" \
    localhost:3000/party-leader/federal/all
)
echo $response | jq

# Save Jong Su-hyang's id
JongSuHyang=$(echo $response | jq -r '.leaders.[] | select(.name="Jong Su-hyang") | .id')
if [ $JongSuHyang != "null" ]; then
    echo Saving Jong Su-hyang\'s id...
    echo $JongSuHyang > .leaderId.txt
fi

# List state leaders
echo \#STATE:
curl -X GET \
    -H "token: $leaderToken" \
    localhost:3000/party-leader/state/all | jq
echo ""

# List city leaders
echo \#MUNICIPAL:
curl -X GET \
    -H "token: $leaderToken" \
    localhost:3000/party-leader/city/all | jq
echo ""

echo Done!
