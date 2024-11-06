#!/bin/bash

#USAGE: ./file_sorter.sh ~/Desktop/sorted_files

# Define destination directories
declare -A file_types=(
    ["images"]="jpg jpeg png gif bmp svg webp heic"
    ["documents"]="pdf doc docx txt rtf odt xlsx xls csv ppt pptx md"
    ["audio"]="mp3 wav ogg m4a flac aac"
    ["video"]="mp4 avi mkv mov wmv flv"
    ["archives"]="zip rar tar gz 7z"
)

# Get target directory from command line argument, or use current directory
target_dir="${1:-$(pwd)}"

# Create target directory if it doesn't exist
mkdir -p "$target_dir"

# Create category directories inside target directory
for dir in "${!file_types[@]}"; do
    mkdir -p "$target_dir/$dir"
done

# Function to get the category for a file extension
get_category() {
    local file_ext="$1"
    for category in "${!file_types[@]}"; do
        if [[ "${file_types[$category]}" =~ (^|[[:space:]])$file_ext($|[[:space:]]) ]]; then
            echo "$category"
            return
        fi
    done
    echo "misc"  # Default category for unknown file types
}

# Main sorting logic
for file in *; do
    # Skip if it's a directory or the script itself
    if [[ -d "$file" ]] || [[ "$file" == "$(basename "$0")" ]]; then
        continue
    fi

    # Get file extension (converted to lowercase)
    ext="${file##*.}"
    ext="${ext,,}"

    # Get category for this file type
    category=$(get_category "$ext")
    
    # Create category directory if it doesn't exist
    mkdir -p "$target_dir/$category"
    
    # Move file to appropriate directory
    mv "$file" "$target_dir/$category/"
    echo "Moved $file to $target_dir/$category/"
done

echo "File sorting complete!"