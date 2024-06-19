#!/bin/bash

echo Will reset the password for Akina!
read -p "Type in the token: " token

curl -X POST \
    -d "identifier=akina@jpop.co.jp" \
    -d "password=Akina2*Pass" \
    localhost:3000/user/resetPassword/$token
echo ""
echo Done!
