#!/bin/bash
TO="444-444-4444"
BODY="Oh hello there!"

curl "http://localhost:4741/twilio/text" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "twilio": {
      "to": "'"${TO}"'",
      "body": "'"${BODY}"'"
    }
  }'

echo
