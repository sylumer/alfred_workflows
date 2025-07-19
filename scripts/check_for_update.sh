#!/bin/zsh --no-rcs

# Convert version number to a number to compare versions.
version_to_number()
{
	local verno="$1"
	
	# Split the version string by periods using cut
	local major=$(echo "$verno" | cut -d'.' -f1)
	local minor=$(echo "$verno" | cut -d'.' -f2)
	local patch=$(echo "$verno" | cut -d'.' -f3)
	
	# Calculate the numeric representation
	local numeric_version=$((major * 1000000 + minor * 1000 + patch * 1))
	
	echo "$numeric_version"
}

# Convert local version number to numeric comparison
local_num=$(version_to_number "$alfred_workflow_version")

# Convert remote version number to numeric comparison
remote_raw=$(curl -s https://raw.githubusercontent.com/sylumer/alfred_workflows/refs/heads/main/thoughtasylum/${alfred_workflow_name:l}/version.txt | head)
remote_num=$(version_to_number "$remote_raw")

# Output result for workflow
if (( remote_num < local_num )); then
	echo -n "old"
elif (( remote_num == local_num )); then
	echo -n "same"
else
	echo -n "new"
fi