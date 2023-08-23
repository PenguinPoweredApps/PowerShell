function Backup-RegistryKey {
    param (
        [Parameter(Mandatory=$true)]
        [string]$KeyPath,
        [Parameter(Mandatory=$true)]
        [string]$BackupFilePath
    )

    reg export $KeyPath $BackupFilePath
}
