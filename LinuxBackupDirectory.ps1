# BackupDirectory.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$sourceDir,
    [Parameter(Mandatory=$true)]
    [string]$backupDir
)

Copy-Item -Path $sourceDir -Destination $backupDir -Recurse
