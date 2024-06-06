#!/bin/bash

# Set mode and cloudflare variables
mode="patch"
cloudflare="run"

# Set file paths
scriptPathPihole="./Cloudflare-Gateway-Pihole"
scriptPathPyhole="./Cloudflare-Gateway-Pyhole"

# Function to run the appropriate script
run_script() {
    local script_path="$1"
    local action="$2"
    "$currentDirectory/$script_path" "$action"
}

# Grant execute permissions to the files
chmod +x "$scriptPathPihole" "$scriptPathPyhole"

# Get the current directory
currentDirectory=$(pwd)

# Function to display colored notifications
notify() {
    local color=$1
    local message=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Run the appropriate script based on mode and cloudflare
case "$mode:$cloudflare" in
    normal:run)
        notify 32 "Running script..."
        run_script "$scriptPathPihole" "run"
        ;;
    normal:leave)
        notify 33 "Leaving script..."
        run_script "$scriptPathPihole" "leave"
        ;;
    patch:run)
        notify 32 "Running script..."
        run_script "$scriptPathPyhole" "run"
        ;;
    patch:leave)
        notify 33 "Leaving script..."
        run_script "$scriptPathPyhole" "leave"
        ;;
esac
