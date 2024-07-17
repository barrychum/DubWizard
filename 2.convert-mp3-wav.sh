#!/bin/bash

project="$1"

# Check if the project directory exists, if not create it along with input and tmp directories
if [ ! -d "${project}" ]; then
  echo "Project directory does not exist."
  exit 1
fi

mkdir -p "${project}/input"
mkdir -p "${project}/tmp"

# Iterate over all mp3 files in the input directory
for file in "${project}/input"/*.mp3; do
  if [[ -f "$file" ]]; then
    # Extract the filename without the extension
    filename=$(basename "$file" .mp3)
    # Convert mp3 to wav using ffmpeg
    ffmpeg  -hide_banner -loglevel error -n -i "$file" -ac 1 -ar 24000 "${project}/tmp/${filename}.wav"
  fi
done

# List the wav files in tmp directory and sort them
find "${project}/tmp" -type f -name '*.wav' -print0 | xargs -0 -n1 basename | sort > "${project}/tmp/wav.txt"

echo "Conversion completed."
