#!/bin/sh

TOKEN="$(pass deepl/token)"
TRANSLATED=$(curl https://api-free.deepl.com/v2/translate -d "auth_key=$TOKEN" -d "text=$(echo "" | dmenu)" -d "target_lang=EN")
TRANSLATED_TEXT=$(echo $TRANSLATED | jq -r '.translations[0].text')

# copy to clipboard
echo $TRANSLATED_TEXT | xclip -sel clip

# type text
xdotool type "$TRANSLATED_TEXT"