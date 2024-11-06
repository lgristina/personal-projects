#!/bin/bash

show_help() {
    echo ""
    echo "Usage: ./open_page.sh <keyword>"
    echo ""
    echo "Available keywords:"
    echo "ai            - AI schedule"
    echo "gh            - GitHub"
    echo "bs            - Brightspace"
    echo "dr            - Google Drive"
    echo "chat          - ChatGPT"
    echo "vsc           - Visual Studio Code"
    echo "obs           - Obsidian"
    echo "cursor        - Cursor"
    echo "teams         - Microsoft Teams"
    echo "cal           - Calendar"
    echo "zoom          - Zoom"
    echo "as            - App Store"
    echo "spotify       - Spotify"
    echo "help          - Show this help message"
    echo ""
}

# Check if keyword is given
if [ -z "$1" ]; then
    echo "You must provide a keyword."
    show_help
    exit 1
fi

# Get the keyword
keyword=$1

# Using a case statement to map keywords to URLs
case $keyword in
    ai)
        open -a "Google Chrome" "https://docs.google.com/spreadsheets/d/1Wtf01d_EvOvvfTM-NRkyRvpQVLGbOvkyDKyN5HpdcbU/edit?gid=0#gid=0"
        ;;
    gh)
        open -a "Google Chrome" "https://github.com"
        ;;
    bs)
        open -a "Google Chrome" "https://brightspace.marist.edu/d2l/home"
        ;;
    dr)
        open -a "Google Chrome" "https://drive.google.com/drive/my-drive"
        ;;
    chat)
        open -a "Google Chrome" "https://chat.openai.com/"
        ;;
    vsc)
        open -a "Visual Studio Code"
        ;;
    obs)
        open -a "Obsidian"
        ;;
    cursor)
        open -a "Cursor"
        ;;
    teams)
        open -a "Microsoft Teams"
        ;;
    cal)
        open -a "Calendar"
        ;;
    zoom)
        open -a "Zoom"
        ;;
    as)
        open -a "App Store"
        ;;
    spotify)
        open -a "Spotify"
        ;;
    help)
        show_help
        ;;
    *)
        echo "Invalid keyword. Please use the format below and choose one of the following keywords:"
        show_help
        exit 1
        ;;
esac


