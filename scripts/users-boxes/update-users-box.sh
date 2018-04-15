#!/bin/bash
TOKEN="BAhJIiUyNzdkZDI2ZjdiMDdlYjgzOWZlMmNmODJmOTJmNjMyYgY6BkVG--107093650851f5d4e686b0e2be351d00c6e4950a"
WRITE_ACCESS=true
ID=8

curl "http://localhost:4741/users_boxes/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "users_box": {
      "write_access": "'"${WRITE_ACCESS}"'"
    }
  }'

echo
