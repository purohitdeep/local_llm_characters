#!/bin/bash
SYSTEM="$1"
PROMPT="$2"

MODEL=$(curl -s http://localhost:11434/api/tags | jq -r '.models[0].name')

curl -s http://localhost:11434/api/chat \
  -H "Content-Type: application/json" \
  -d "{
    \"model\": \"$MODEL\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"$SYSTEM\"},
      {\"role\": \"user\", \"content\": \"$PROMPT\"}
    ]
  }" | jq -r '.message.content'
