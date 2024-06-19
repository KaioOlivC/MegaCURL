#!/bin/bash
dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

cd ../routes

./user-register-akina.sh
./user-login-akina.sh
./filliation-filliate-akina.sh
./candidacy-candidate-akina.sh
