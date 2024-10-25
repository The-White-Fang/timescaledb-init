#!/bin/bash
# A single script to generate an entry in userlist.txt

# Determine the directory where the script is located
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

# Navigate to the parent directory of 'scripts'
parent_dir=$(dirname "$script_dir")

USERLIST_FILE="$parent_dir/config/userlist.txt"

# Create the userlist.txt file if it doesn't exist
if [[ ! -f "$USERLIST_FILE" ]]; then
  touch "$USERLIST_FILE"
fi

if [[ $# -eq 1 ]]; then
  USERNAME="$1"
else
  read -r -p "Enter username: " USERNAME
fi

read -r -s -p "Enter password: " PASSWORD
echo >&2

# Using openssl md5 to avoid differences between OSX and Linux (`md5` vs `md5sum`)
encrypted_password="md5$(printf "%s%s" "$PASSWORD" "$USERNAME" | openssl md5 -binary | xxd -p)"

# Append the username and encrypted password to userlist.txt
echo "\"$USERNAME\" \"$encrypted_password\"" >> "$USERLIST_FILE"
