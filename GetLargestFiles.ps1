function Get-LargestFiles {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Get-ChildItem -Path $Path -Recurse | Sort-Object Length -Descending | Select-Object -First 10
}
