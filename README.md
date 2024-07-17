# DubWizard

DubWizard is a powerful and user-friendly tool designed to streamline the process of overlaying audio files onto videos. Whether you're a professional editor or a hobbyist, DubWizard helps you efficiently sync and integrate your audio tracks with video footage.

## Features

- **Effortless Audio Integration**: Easily overlay audio files onto video tracks.
- **Accurate Synchronization**: Sync audio precisely using timestamp files.
- **Batch Processing**: Process multiple audio files in one go for large projects.
- **High-Quality Output**: Export videos with professionally merged audio tracks.
- **Intuitive Interface**: Simple command-line interface for easy usage.

## Requirements

- **Operating System**: Linux, macOS, or Windows (with Bash support)
- **Dependencies**:
  - `ffmpeg`
  - `ffprobe`
  - `awk`
  - `bc`

## Installation

1. **Install Dependencies**:
   - On Debian/Ubuntu:
     ```sh
     sudo apt-get update
     sudo apt-get install ffmpeg gawk bc
     ```
   - On macOS (using Homebrew):
     ```sh
     brew install ffmpeg gawk bc
     ```

2. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/dubwizard.git
   cd dubwizard
   ```

## Usage

### Command-Line Interface

1. **Prepare Your Project**:
   - Place your video file in the `input` folder inside your project directory.
   - Place your audio files and `timestamp.txt` file in the `tmp` folder inside your project directory.

   The `timestamp.txt` file should have the following format:
   ```
   timestamp_in_seconds|audio_filename.wav
   ```

2. **Run DubWizard**:
   ```sh
   ./dubwizard.sh /path/to/your/project
   ```

### Example

```sh
./dubwizard.sh /home/user/mydubproject
```

## Script Details

The `dubwizard.sh` script automates the process of overlaying audio files onto a video. It reads a timestamp file to accurately position each audio file on a silent audio track of the same duration as the video, then merges this audio track with the video.

### Script Breakdown

1. **Initialization**:
   - Sets up project paths and checks if the necessary directories and files exist.
   - Creates a silent audio track with the same duration as the input video.

2. **Audio Processing**:
   - Reads the `timestamp.txt` file and processes each audio file by overlaying it onto the silent audio track at the specified timestamp.

3. **Final Output**:
   - Combines the processed audio track with the original video to create the final dubbed video.

## Contributing

We welcome contributions to improve DubWizard! If you have suggestions, bug reports, or would like to contribute code, please open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, please contact [yourname@youremail.com](mailto:yourname@youremail.com).

---

Thank you for using DubWizard! We hope it helps you efficiently integrate audio files into your video projects.

P: toggle pause.  Video is loaded in pause mode.
T: timestamped / tag

B/F: seek backward / forward
G: goto
[/]: frame backword / forward
up/down arrow: move between item

Enter: play audio of the current item
M: toggle mute. Video is muted when loaded.
+: increase volume
-: decrease volume

Q: write and exit

