#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Variables
if [ -f .env ]; then
    while IFS= read -r line; do
        export "$line"
    done < .env
else
    echo "Error: The .env file is missing."
    exit 1
fi

# Check if the current user matches the target user
IP_ADDRESS="$PAM_RHOST"
HOSTNAME="$(hostname)"
MESSAGE="User $TARGET_USER logged in from $IP_ADDRESS to $HOSTNAME via SSH."

$SCRIPT_DIR/scripts/send_message.sh "$CHAT_ID" "$TELEGRAM_BOT_TOKEN" "$MESSAGE" true
