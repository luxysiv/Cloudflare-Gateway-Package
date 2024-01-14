# Set mode and cloudflare variables
$mode = "patch"
$cloudflare = "run"

# Set file paths
$scriptPathPihole = "./Cloudflare-Gateway-Pihole"
$scriptPathPyhole = "./Cloudflare-Gateway-Pyhole"

# Check if running on Linux
if ($IsLinux) {
    # Grant execute permissions to the files
    chmod +x $scriptPathPihole
    chmod +x $scriptPathPyhole
}

# Get the current directory
$currentDirectory = Get-Location

# Run the appropriate script based on mode and cloudflare
if ($mode -eq "normal") {
    if ($cloudflare -eq "run") {
        Start-Process -FilePath "$currentDirectory/$scriptPathPihole" -ArgumentList "run" -Wait
    }
    elseif ($cloudflare -eq "leave") {
        Start-Process -FilePath "$currentDirectory/$scriptPathPihole" -ArgumentList "leave" -Wait
    }
}
elseif ($mode -eq "patch") {
    if ($cloudflare -eq "run") {
        Start-Process -FilePath "$currentDirectory/$scriptPathPyhole" -ArgumentList "run" -Wait
    }
    elseif ($cloudflare -eq "leave") {
        Start-Process -FilePath "$currentDirectory/$scriptPathPyhole" -ArgumentList "leave" -Wait
    }
}
