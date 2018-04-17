#!/bin/bash
TOKEN="BAhJIiU2OWNlMzY3NGEwNDVmNWRhZTdlM2JjYzg0YjFjYzhmYwY6BkVG--ba626afacebc59de7f069baf555ecc531d1e351d"

curl "http://localhost:4741/users" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
