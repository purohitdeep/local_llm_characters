#!/bin/bash

MODEL_ROOT="$HOME/.lmstudio/models"
MODEL_PATHS=()
MODEL_NAMES=()

# Recursively find all .gguf files under the model root
while IFS= read -r -d $'\0' gguf; do
  MODEL_PATHS+=("$gguf")
  MODEL_NAMES+=("$(basename "$(dirname "$gguf")")/$(basename "$gguf")")
done < <(find "$MODEL_ROOT" -type f -name "*.gguf" -print0)

if [ ${#MODEL_PATHS[@]} -eq 0 ]; then
  echo "No .gguf models found under $MODEL_ROOT"
  exit 1
fi

echo "Available LM Studio models:"
for i in "${!MODEL_NAMES[@]}"; do
  echo "$((i+1))) ${MODEL_NAMES[$i]}"
done

read -p "Select a model number to 'activate': " SELECTION
INDEX=$((SELECTION-1))

if [[ $INDEX -ge 0 && $INDEX -lt ${#MODEL_PATHS[@]} ]]; then
  SELECTED="${MODEL_PATHS[$INDEX]}"
  echo "$SELECTED" > ~/.lmstudio_active_model
  echo "Model '${MODEL_NAMES[$INDEX]}' selected."
  echo "👉 Please load this model manually in LM Studio GUI."
else
  echo "Invalid selection."
  exit 1
fi
