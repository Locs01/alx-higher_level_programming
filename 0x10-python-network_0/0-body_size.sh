[200~#!/bin/bash

# Check if URL argument is provided
if [ $# -ne 1 ]; then
	    echo "Usage: $0 <URL>"
	        exit 1
fi

URL=$1

# Send request to the URL and store the response body in a temporary file
RESPONSE=$(curl -sS "$URL" -o response_body.tmp)

# Check if curl command was successful
if [ $? -ne 0 ]; then
	    echo "Failed to retrieve response from $URL"
	        exit 1
fi

# Get the size of the response body in bytes
BODY_SIZE=$(stat -c '%s' response_body.tmp)

echo "Size of the response body: $BODY_SIZE bytes"

# Clean up the temporary file
rm -f response_body.tmp
