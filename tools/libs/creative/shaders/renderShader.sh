#!/bin/sh

show_help() {
  echo "Usage: $0 -r RENDER_NAME [-w WIDTH] [-h HEIGHT] [-s START_FRAME] [-f FRAME_RATE] [-e END_FRAME | -l LENGTH] [-p PATH_TO_SHADER] [-q QUALITY]"
  echo ""
  echo "  -r  Render name (valid filename string)"
  echo "  -w  Width of the rendered video (default: 1920)"
  echo "  -h  Height of the rendered video (default: 1080)"
  echo "  -s  Starting frame (default: 0)"
  echo "  -f  Frame rate (default: 25)"
  echo "  -e  Ending frame (cannot be used with -l)"
  echo "  -l  Length in seconds (cannot be used with -e)"
  echo "  -p  Path to shader (default: /home/alex/documents/creations/graphics/visualisations/shaders/noiseExplorations/shaders/currentShader.frag)"
  echo "  -q  Quality (resolution preset, can be: 1080p, square1080p, half1080p, squarehalf1080p, 720p, square720p, 2160p, square2160p, 1440p, square1440p)"
  echo "  -h  Show this help message"
  exit 1
}

# Default values
width=1920
height=1080
start_frame=0
frame_rate=25
shader_path="/home/alex/documents/creations/graphics/visualisations/shaders/noiseExplorations/shaders/currentShader.frag"

# Save the current working directory
original_directory="$(pwd)"

while getopts ":w:h:s:e:f:r:l:p:q:" opt; do
  case $opt in
    w)
      width="$OPTARG"
      ;;
    h)
      height="$OPTARG"
      ;;
    s)
      start_frame="$OPTARG"
      ;;
    e)
      end_frame="$OPTARG"
      ;;
    f)
      frame_rate="$OPTARG"
      ;;
    r)
      render_name="$OPTARG"
      if echo "$render_name" | grep -q '[/\:*?"<>|]'; then
        echo "Render name contains invalid characters."
        exit 1
      fi
      ;;
    l)
      length="$OPTARG"
      ;;
    p)
      shader_path="$OPTARG"
      ;;
    q)
      quality="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      show_help
      ;;
  esac
done

if [ -z "$render_name" ] || { [ -n "$end_frame" ] && [ -n "$length" ]; } || { [ -z "$end_frame" ] && [ -z "$length" ]; }; then
  show_help
fi

if [ -n "$quality" ]; then
  case $quality in
    1080p)
      width=1920
      height=1080
      ;;
    square1080p)
      width=1080
      height=1080
      ;;
    half1080p)
      width=960
      height=540
      ;;
    squarehalf1080p)
      width=540
      height=540
      ;;
    720p)
      width=1280
      height=720
      ;;
    square720p)
      width=720
      height=720
      ;;
    2160p)
      width=3840
      height=2160
      ;;
    square2160p)
      width=2160
      height=2160
      ;;
    1440p)
      width=2560
      height=1440
      ;;
    square1440p)
      width=1440
      height=1440
      ;;
    *)
      echo "Invalid quality option. Please select from: 1080p, 720p, 2160p, 1440p."
      exit 1
      ;;
  esac
fi


if [ -n "$length" ]; then
  end_frame=$((start_frame + length * frame_rate))
fi

last_frame=$((end_frame - 1))

# Create the folder if it doesn't exist
target_folder="/tmp/renders/$render_name/"
mkdir -p "$target_folder"

# If folder already contains pngs, ask the user what to do
if ls "$target_folder"/*.png >/dev/null 2>&1; then
  while true; do
    echo "The target folder already contains PNG images. What do you want to do?"
    echo "1. Continue and overwrite the images"
    echo "2. Abort"
    echo "3. Preview the images with sxiv"
    read -r action
    case $action in
      1)
        rm "$target_folder"/*.png
        break
        ;;
      2)
        exit 1
        ;;
      3)
        sxiv -t "$target_folder"/*.png
        ;;
      *)
        echo "Invalid action. Please enter 1, 2, or 3."
        ;;
    esac
  done
fi

# Navigate to the new folder
cd "$target_folder" || exit 1

# Check if output video already exists
output_file="$original_directory/$render_name.mp4"
if [ -f "$output_file" ]; then
  while true; do
    echo "The output file $output_file already exists. What do you want to do?"
    echo "1. Continue and overwrite the video"
    echo "2. Abort"
    echo "3. Preview the video with mpv"
    read -r action
    case $action in
      1)
        break
        ;;
      2)
        exit 1
        ;;
      3)
        mpv "$output_file"
        ;;
      *)
        echo "Invalid action. Please enter 1, 2, or 3."
        ;;
    esac
  done
fi

echo "About to render $shader_path at resolution $width x $height with frame rate $frame_rate. $last_frame frames will be rendered as PNGs in the directory $target_folder."

# Start glslViewer in the background
glslViewer "$shader_path" --headless -w "$width" -h "$height" -e "frames,$start_frame,$end_frame,$frame_rate" --noncurses &

# Save the process ID
glslViewer_pid=$!

# Wait for the last frame to be present
while [ ! -f "$(printf "%05d.png" "$last_frame")" ]; do
  sleep 5
done

# Wait an additional 15 seconds just in case
sleep 15

# Kill the glslViewer process
kill "$glslViewer_pid"

# Return to the original directory
cd "$original_directory" || exit 1

# Create a video from the PNG files
ffmpeg -y -i "$target_folder/%05d.png" -vcodec libx264 -crf 25 -pix_fmt yuv420p "$render_name.mp4"

# Play the video using mpv
mpv "$render_name.mp4"


