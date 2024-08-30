#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir" || exit

cd ../routes

# Register admin
./admin-register-akina.sh

# Login
./auth-login-akina.sh

# Add a vehicle
./vehicle-create-pink.sh

# Add a driver
./driver-register-momoko.sh

# Add three violations to the car, for good measure
./violation-add-to-pink.sh
./violation-add-to-pink.sh
./violation-add-to-pink.sh
