#!/bin/zsh

# Check if 'lms' CLI is available
if ! command -v lms &> /dev/null; then
  echo "❌ 'lms' CLI not found. Please install LM Studio CLI and try again."
  exit 1
fi

#echo "🔍 Listing available LM Studio models..."

# Get all models from lms ls command
MODEL_OUTPUT=$(lms ls --llm)
#echo "$MODEL_OUTPUT"

# Extract only the model names (keys) from LLMs section
MODEL_KEYS=($(echo "$MODEL_OUTPUT" | awk '/^LLMs/{flag=1; next} /^Embedding Models/{flag=0} flag && NF>0 && $1 !~ /PARAMS|SIZE/ {print $1}'))

if [[ ${#MODEL_KEYS[@]} -eq 0 ]]; then
  echo "No models found. Ensure you have local models in LM Studio."
  exit 1
fi

#echo "\nAvailable models for loading:"
for i in {1..${#MODEL_KEYS[@]}}; do
  echo "$i) ${MODEL_KEYS[$i]}"
done

echo -n "\nSelect a model number to load: "
read SELECTION

if [[ $SELECTION -ge 1 && $SELECTION -le ${#MODEL_KEYS[@]} ]]; then
  SELECTED_MODEL="${MODEL_KEYS[$SELECTION]}"
  echo "✅ Selected: $SELECTED_MODEL"

  # === Set defaults per model ===
  case "$SELECTED_MODEL" in
    gemma-3-1b-it)
      CTX=32768
      ;;
    gemma-3-27b-it)
      CTX=32768
      ;;
    qwen2.5-coder-14b-instruct)
      CTX=131072
      ;;
    deepseek-r1-distill-qwen-32b)
      CTX=131072
      ;;
    *)
      CTX=4096
      ;;
  esac

  lms unload --all

  # Load the selected model
  lms load "$SELECTED_MODEL" --context-length $CTX --gpu max

  echo "✅ Model '$SELECTED_MODEL' loaded successfully."
else
  echo "❌ Invalid selection."
  exit 1
fi
