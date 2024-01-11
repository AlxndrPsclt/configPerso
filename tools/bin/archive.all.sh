#!/bin/sh

archiveFile="/home/alex/.config/perso/tools/bin/archive" # Replace with the actual path to archiveFile.sh


# Check if a path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

TARGET_PATH=$1

# Check if the path exists
if [ ! -e "$TARGET_PATH" ]; then
    echo "Path not found: $TARGET_PATH"
    exit 1
fi

# Function to check filename and archive
check_and_archive() {
    file=$1
    # Check if file starts with @..
    sh "$archiveFile" "$file"
}

export check_and_archive
export archiveFile

# If path is a file
if [ -f "$TARGET_PATH" ]; then
    check_and_archive "$TARGET_PATH"

# If path is a directory
elif [ -d "$TARGET_PATH" ]; then
    find "$TARGET_PATH" -type f -print0 | parallel -0 'file={}; sh '"$archiveFile"' "$file";'
fi
