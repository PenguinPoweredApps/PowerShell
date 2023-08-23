function Clean-OldFiles {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [int]$Days = 30
    )

    Get-ChildItem -Path $Path -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$Days) } | Remove-Item -Force
}
