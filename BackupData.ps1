#!/usr/bin/pwsh

# Source directory to be backed up
$sourceDir = "/source-directory"

# Destination directory for backup
$destinationDir = "/destination-directory"

# Execute the rsync command to perform the backup
rsync -av --progress $sourceDir $destinationDir
