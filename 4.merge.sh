#!/bin/bash

# Ensure the project parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project_path>"
  exit 1
fi

project="$1"

# Set up directories and files
folder="${project}/tmp"
output_folder="${project}/output"
inputfile="${project}/input/video.mp4"
timestamp_file="${folder}/timestamp.txt"
silent_file="${folder}/silent.wav"

mkdir -p "$folder" "$output_folder"

# Get full path of input file
fullpath="$(realpath "$inputfile")"
filename="${inputfile%.*}"

echo
echo "Creating timeline audio file"

# Get video duration
duration="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$inputfile")"

# Create silent audio file
ffmpeg -hide_banner -loglevel error -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=24000 -t "$duration" -ac 1 "$silent_file"

# Function to process audio file
process_audio() {
  local pos=$1
  local audio_file=$2

  # Convert to milliseconds
  pos=$(echo "$pos * 1000" | bc | awk '{printf "%d\n", $1}')

  # Create a temporary file
  local tempfile
  tempfile="$(mktemp).wav"

  # Overlay the audio file
  ffmpeg -i "$silent_file" -i "$folder/$audio_file" -filter_complex "[1:a]adelay=${pos}[delayed];[0:a][delayed]amix=inputs=2:duration=first:dropout_transition=0:normalize=0[out]" -map "[out]" -hide_banner -loglevel error "$tempfile"

  # Move the temporary file to replace silent.wav
  mv "$tempfile" "$silent_file"
}

echo
echo "Overlay individual audio files to timeline"

# Process each timestamp and audio file
awk -F'|' '{seen[$2]=$0} END {for (key in seen) print seen[key]}' "$timestamp_file" | sort -t'|' -k1,1n | while IFS='|' read -r pos audio_file
do
  printf "%s : %s\n" "$pos" "$audio_file"
  process_audio "$pos" "$audio_file"
done

echo
echo "Combining merged timeline audio to original video file"

# Move the final silent file to the output folder
mv "$silent_file" "$output_folder/merged.wav"

# Combine video and merged audio into the final output
ffmpeg -hide_banner -loglevel error -i "$inputfile" -i "$output_folder/merged.wav" -c:v copy -c:a aac -b:a 128k -ar 44100 -ac 1 -map 0:v:0 -map 1:a:0 "$output_folder/final.mp4"

echo
echo "Completed.  Please check output file $output_folder/final.mp4"
