#!/bin/bash

# Set mode and cloudflare variables
mode="patch"
cloudflare="run"

# Set file paths
scriptPathPihole="./Cloudflare-Gateway-Pihole"
scriptPathPyhole="./Cloudflare-Gateway-Pyhole"

# Grant execute permissions to the files
chmod +x "$scriptPathPihole" "$scriptPathPyhole"

# Run the appropriate script based on mode and cloudflare
case "$mode:$cloudflare" in
    normal:run)
        "$currentDirectory/$scriptPathPihole" run
        ;;
    normal:leave)
        "$currentDirectory/$scriptPathPihole" leave
        ;;
    patch:run)
        "$currentDirectory/$scriptPathPyhole" run
        ;;
    patch:leave)
        "$currentDirectory/$scriptPathPyhole" leave
        ;;
esac
