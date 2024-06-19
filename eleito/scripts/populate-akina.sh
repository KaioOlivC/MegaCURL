#!/bin/bash
password=$(cat .password.txt)

cd ../routes

./user-register-akina.sh
./user-login-akina.sh
./filliation-filliate-akina.sh
./candidacy-candidate-akina.sh
