#!/bin/bash
TO="+18134173803"
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
