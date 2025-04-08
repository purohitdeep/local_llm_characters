#!/bin/bash
QUESTION="$1"

RESPONSE=$(curl -s http://localhost:1234/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d "$(jq -n \
    --arg question "$QUESTION" \
    '{
      model: "gemma-3-1b-instruct",
      messages: [
      {"role": "system", "content": "You are a Marvin robot from hitchikers guide to the galaxy."},
      {"role": "user", "content": $question}
      ],
      temperature: 0.7,
      stream: false
    }')")

echo "$RESPONSE" | jq -r '.choices[0].message.content'
