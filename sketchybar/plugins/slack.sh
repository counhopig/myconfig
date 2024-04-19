#!/bin/bash

SLACK_COUNT=$(osascript -e 'tell application "Slack" to return the unread count of inbox')

if [[ "$SLACK_COUNT" -gt 0 ]]; then
  sketchybar --set slack label=$MAIL_COUNT labal.drawing=on icon.drawing=on
else
  sketchybar --set slack label.drawing=off icon.drawing=off
fi
