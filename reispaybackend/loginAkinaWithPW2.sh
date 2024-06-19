#!/bin/bash

echo Will login Akina!

response=$(
    curl -s -X POST \
    -d "identifier=akina@jpop.co.jp" \
    -d "password=Akina2*Pass" \
    localhost:3000/user/login
)
echo $response
token=$(echo $response | jq -r ".token")

if [ $token != "null" ]; then
    echo Saving token...
    echo $token > .token.txt
fi

echo Done!
