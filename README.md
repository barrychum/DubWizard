# DubWizard

DubWizard is a powerful and user-friendly tool designed to streamline the process of overlaying audio files onto videos. Whether you're a professional editor or a hobbyist, DubWizard helps you efficiently sync and integrate your audio tracks with video footage.

## Features

- **Effortless Audio Integration**: Easily overlay audio files onto video tracks.
- **Accurate Synchronization**: Sync audio precisely using timestamp files.
- **Batch Processing**: Process multiple audio files in one go for large projects.
- **High-Quality Output**: Export videos with professionally merged audio tracks.
- **Intuitive Interface**: Simple command-line interface for easy usage.



## Installation

1. **Install Dependencies**:

   ```sh
   git clone https://github.com/yourusername/dubwizard.git
   cd dubwizard
   pip install -r requirements.txt
   ```

## Usage

### Command-Line Interface

1. **Prepare Your Project**:
   Execute 1.new-project <project name> to create the project folder structure.

2. **Generate working files**:
   Copy your audio mp3s and the video.mp4 to input folder.
   Execute 2.gen-wav <project name> to convert the mp3 in input folder to wav in tmp folder.

3. **Run DubWizard**:
   Execute 3.dubbing to crete timestamp for the audio files.

   P: toggle pause.  Video is loaded in pause mode.
   T: timestamped / tag

   B/F: seek backward / forward
   G: goto the time of the current audio file
   [/]: frame backword / forward
   up/down arrow: move between item

   Enter: play audio of the current item
   M: toggle mute. Video is muted when loaded.
   +: increase volume
   -: decrease volume

   Q: Exit

4. **Merge time audio and timeline**:
   Execute 4.merge <project name> to merge the audio files according to the timestamps
   Final mp4 is in the output folder.
   

## License

This project utilize PyQT and is licensed under the GPU License. See the [LICENSE](LICENSE) file for details.





