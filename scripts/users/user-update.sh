#!/bin/bash
PHONE='18135553803'
ID=5
TOKEN="BAhJIiUyYzlhZGQxYzExNGJiMjJhY2MzNGJkOTc2NDNhNTljZAY6BkVG--27b8434ff34a3a6091d34f5245f9ef6b86e8274d"

curl "http://localhost:4741/users/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "phone": "'"${PHONE}"'"
    }
  }'

echo
