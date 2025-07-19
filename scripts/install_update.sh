#!/bin/zsh

# Initialise
DESTINATION="$HOME/Downloads/$alfred_workflow_name.alfredworkflow"
REMOTE="https://raw.githubusercontent.com/sylumer/alfred_workflows/main/thoughtasylum/${alfred_workflow_name:l}/$alfred_workflow_name.alfredworkflow"

# Download
curl -L -o "$DESTINATION" "$REMOTE"

# Install
open "$DESTINATION"