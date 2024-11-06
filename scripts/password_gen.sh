#!/bin/bash

export LC_ALL=C

# Define the character set (all printable characters from a QWERTY keyboard)
chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-='

# Generate a 20-character password using /dev/urandom
password=$(tr -dc "$chars" < /dev/urandom | head -c 20)

# Print the generated password
echo "Generated password: $password"

