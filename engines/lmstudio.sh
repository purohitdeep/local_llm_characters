#!/bin/zsh
SYSTEM="$1"
PROMPT="$2"

# Get the currently loaded model
MODEL=$(lms ps | grep "Identifier:" | head -1 | sed 's/Identifier: //')

# Make the API request and extract content in one go
curl -s http://localhost:1234/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d "$(jq -n \
    --arg model "$MODEL" \
    --arg system "$SYSTEM" \
    --arg prompt "$PROMPT" \
    '{
      model: $model,
      messages: [
        {role: "system", content: $system},
        {role: "user", content: $prompt}
      ],
      temperature: 0.7,
      stream: false
    }')" | jq -r '.choices[0].message.content'
