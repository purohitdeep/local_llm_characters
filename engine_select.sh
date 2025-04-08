#!/bin/bash
SYSTEM="$1"
PROMPT="$2"

if curl -s http://localhost:1234/v1/models &>/dev/null; then
  $(dirname $0)/engines/lmstudio.sh "$SYSTEM" "$PROMPT"
elif curl -s http://localhost:11434/version &>/dev/null; then
  $(dirname $0)/engines/ollama.sh "$SYSTEM" "$PROMPT"
else
  echo "No local LLM engine detected (LM Studio or Ollama)."
  exit 1
fi
