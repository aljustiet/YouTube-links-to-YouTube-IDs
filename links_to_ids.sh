#!/bin/bash

# Define the temporary file to edit
tempfile=$(mktemp /tmp/youtube_links.XXXXXX.txt)

# Open vim to allow the user to paste URLs
vim "$tempfile"

# Read the file line by line to extract YouTube video IDs
while IFS= read -r url
do
  # Use sed to extract the YouTube ID
  id=$(echo "$url" | sed -n 's/.*v=\([^&]*\).*/\1/p')
  
  # Print the ID if it was found
  if [[ ! -z "$id" ]]; then
    echo "$id"
  fi
done < "$tempfile"

# Delete the temporary file
rm "$tempfile"