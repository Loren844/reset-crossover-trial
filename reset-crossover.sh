#!/bin/bash
PLIST="$HOME/Library/Preferences/com.codeweavers.CrossOver.plist"

if [ ! -f "$PLIST" ]; then
  echo "Error: file not found: $PLIST"
  exit 1
fi

TODAY=$(date -u "+%m/%d/%y %H:%M:%S")

/usr/libexec/PlistBuddy -c "Set :FirstRunDate $TODAY" "$PLIST" 2>/dev/null

if [ $? -ne 0 ]; then
  # La clé n'existe pas encore, on la crée
  echo "The key 'FirstRunDate' does not exist. Exiting with error."
  exit 1
fi

# Convertit en format binaire pour que macOS le relise correctement
plutil -convert binary1 "$PLIST"

echo "FirstRunDate reset to: $TODAY"
