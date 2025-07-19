#!/bin/zsh --no-rcs

verno=1.7.0

# Split the version string by periods using simple string operations
major=$(echo $verno | cut -d'.' -f1)
minor=$(echo $verno | cut -d'.' -f2)
patch=$(echo $verno | cut -d'.' -f3)

# Calculate the numeric representation
# Major * 1,000,000 + Minor * 1,000 + Patch * 1
numeric_version=$((major * 1000000 + minor * 1000 + patch * 1))

# Output the result
echo $numeric_version