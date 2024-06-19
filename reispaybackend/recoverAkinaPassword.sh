#!/bin/bash

echo Will request a password recovery for Akina!
curl -X POST \
    -d "identifier=akina@jpop.co.jp" \
    localhost:3000/user/forgotPassword
echo ""
echo Done!
