#!/bin/bash
CHARACTER="$1"
shift
PROMPT="$*"

$(dirname $0)/characters/${CHARACTER}.sh "$PROMPT"
