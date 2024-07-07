#!/bin/sh

if [ "$NODE_RED_MODE" = "editor" ]; then
  echo "Starting Node-RED in editor mode..."
  node-red --settings=/data/settings.js -D httpAdminRoot=/ -D readOnly=false
else
  echo "Starting Node-RED in UI mode..."
  node-red --settings=/data/settings.js
fi
