#!/bin/bash

# Determine the directory where the script is located
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

# Navigate to the parent directory of 'scripts'
parent_dir=$(dirname "$script_dir")

# Define the target directory for the certificates
certs_dir="$parent_dir/config/certs"

# Create the target directory if it does not exist
mkdir -p "$certs_dir"

# Generate the self-signed certificate using OpenSSL
openssl req -newkey rsa:2048 -nodes -keyout "$certs_dir/server.key" -x509 -days 3650 -out "$certs_dir/server.crt" \
-subj "/C=IN/ST=Delhi/L=Delhi/O=Example/OU=IT/CN=example.com/emailAddress=info@example.com"

echo "Certificates generated and saved in: $certs_dir"

