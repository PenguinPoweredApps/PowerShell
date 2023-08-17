#!/usr/bin/pwsh

# Source directory to be backed up
$sourceDir = "/home/penguinpoweredapps"

# Destination directory for backup
$destinationDir = "/media/penguinpoweredapps/27244a8a-6caa-43f0-9dc6-130d933a3be1/Backup/Data"

# Execute the rsync command to perform the backup
rsync -av --progress $sourceDir $destinationDir
