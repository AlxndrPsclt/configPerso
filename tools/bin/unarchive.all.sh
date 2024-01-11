#!/bin/sh

unarchiveFile="/home/alex/.config/perso/tools/bin/unarchive" # Replace with the actual path to archiveFile.sh


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
check_and_unarchive() {
    file=$1
    # Check if file starts with @..
    sh "$unarchiveFile" "$file"
}

export check_and_unarchive
export unarchiveFile

# If path is a file
if [ -f "$TARGET_PATH" ]; then
    check_and_unarchive "$TARGET_PATH"

# If path is a directory
elif [ -d "$TARGET_PATH" ]; then
    echo "Unarchiving $TARGET_PATH"
    find "$TARGET_PATH" -type f -name "@..*" -print0 | parallel -0 'file={}; sh '"$unarchiveFile"' "$file";'
fi

