#!/bin/zsh --no-rcs

# Subfolder path is first parameter and must be provided

# Define path  to local destination folder and clear it out
DEST="$HOME/Sync/Alfred/Alfred.alfredpreferences/workflows/$alfred_workflow_uid/$(basename $1)"
rm -rf "$DEST" && mkdir -p "$DEST"

# Identify files to download from the workflow's resources location on GitHub
curl -s https://api.github.com/repos/sylumer/alfred_workflows/contents/thoughtasylum/$1 | \
sed -n 's/.*"download_url": *"\([^"]*\)".*/\1/p' | \

# Download each identified file into the local destination
while read url; do
	filename=$(echo "$url" | sed 's/.*\///')
	echo "Downloading $filename..."
	curl -sL "$url" -o "$DEST/$filename"
done