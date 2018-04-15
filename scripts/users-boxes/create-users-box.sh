#!/bin/bash
TOKEN="BAhJIiUyNzdkZDI2ZjdiMDdlYjgzOWZlMmNmODJmOTJmNjMyYgY6BkVG--107093650851f5d4e686b0e2be351d00c6e4950a"
USER_ID=1
BOX_ID=1
WRITE_ACCESS=false

curl "http://localhost:4741/users_boxes" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "users_box": {
      "user_id": "'"${USER_ID}"'",
      "box_id": "'"${BOX_ID}"'",
      "write_access": "'"${WRITE_ACCESS}"'"
    }
  }'

echo
