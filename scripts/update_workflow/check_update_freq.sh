#!/bin/zsh --no-rcs

# Input values
LASTCHECK="$lastupdatecheck"
CHECKFREQ=$UpdateCheckFrequency

# Exit early if LASTCHECK is not set or empty
if [[ -z "$LASTCHECK" ]]; then
  echo -n "NOCHECK"
  exit 0
fi

# Get current date
TODAY=$(date +%Y-%m-%d)

# Convert dates to seconds since epoch
lastcheck_epoch=$(date -j -f "%Y-%m-%d" "$LASTCHECK" +"%s")
today_epoch=$(date -j -f "%Y-%m-%d" "$TODAY" +"%s")

# Calculate the number of days since last check
elapsed_days=$(( (today_epoch - lastcheck_epoch) / 86400 ))

# Compare to CHECKFREQ
if (( elapsed_days >= CHECKFREQ )); then
  echo -n "CHECKNOW"
else
  echo -n "CHECKLATER"
fi
