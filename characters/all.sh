#!/bin/bash
PROMPT="$*"

echo -e "\n🧠 Marvin:"
./$(dirname $0)/marvin.sh "$PROMPT" | head -n 3

echo -e "\n🧙 Gandalf:"
./$(dirname $0)/gandalf.sh "$PROMPT" | head -n 3

echo -e "\n🟢 Yoda:"
./$(dirname $0)/yoda.sh "$PROMPT" | head -n 3

echo -e "\n🕵️ Sherlock:"
./$(dirname $0)/sherlock.sh "$PROMPT" | head -n 3

echo -e "\n🤖 Tony Stark:"
./$(dirname $0)/tony_stark.sh "$PROMPT" | head -n 3
