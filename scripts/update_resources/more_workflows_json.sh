#!/bin/zsh --no-rcs

# Process more workflows JSON and remove the entry for the current workflow
awk -v uid="$alfred_workflow_bundleid" '
BEGIN {
  inside_array = 0
  collecting_object = 0
  brace_depth = 0
  object = ""
  first = 1
}
{
  # Wait for start of items array
  if (!inside_array) {
	if ($0 ~ /"items"[[:space:]]*:[[:space:]]*\[/) {
	  inside_array = 1
	  print "{\"items\":["
	}
	next
  }

  # Stop at end of array
  if ($0 ~ /^\][[:space:]]*\}/) {
	print "\n]}"
	exit
  }

  # Skip commas between objects
  if ($0 ~ /^[[:space:]]*,[[:space:]]*$/) next
  if ($0 ~ /^[[:space:]]*$/) next

  # Begin collecting object
  if (!collecting_object && $0 ~ /^[[:space:]]*\{/) {
	collecting_object = 1
	brace_depth = gsub(/\{/, "{") - gsub(/\}/, "}")
	object = $0
	next
  }

  # Continue collecting
  if (collecting_object) {
	object = object "\n" $0
	brace_depth += gsub(/\{/, "{") - gsub(/\}/, "}")
	if (brace_depth == 0) {
	  collecting_object = 0

	  # Remove trailing comma, if any
	  sub(/[[:space:]]*,[[:space:]]*$/, "", object)

	  # Skip if it matches the target UID
	  if (object ~ "\"uid\"[[:space:]]*:[[:space:]]*\"" uid "\"") next

	  # Print with comma if needed
	  if (!first) {
		printf(",\n")
	  }
	  printf("%s", object)
	  first = 0
	}
  }
}
' "more_workflows/workflows.json"
