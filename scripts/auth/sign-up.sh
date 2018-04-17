#!/bin/bash
EMAIL=murray@murray
PASSWORD=murray
PHONE="18134173803"

curl "http://localhost:4741/sign-up" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'",
      "phone": "'"${PHONE}"'"
    }
  }'

echo
