param (
    [Parameter(Mandatory=$true)]
    [string]$FolderPath,
    
    [Parameter(Mandatory=$true)]
    [int]$DaysOlderThan
)

$Now = Get-Date
$LastWrite = $Now.AddDays(-$DaysOlderThan)
$OldFiles = (Get-ChildItem -Path $FolderPath -File -Recurse).Where{ $_.LastWriteTime -le $LastWrite }

foreach ($File in $OldFiles) {
    Write-Host "Deleting file $File"
    try {
        Remove-Item -Path $File.FullName -Force -ErrorAction Stop 
        Write-Verbose -Message 'Deleted file [$($File.FullName)].'
    } catch [System.IO.IOException] {
        Write-Warning 'The file $($File.FullName) could not be removed because it is probably read-only.'
        $SetWritable = Read-Host -Prompt 'Do you want to make the file writable? (Y/N)'
        if ($SetWritable -eq 'Y') {
            try {
                $File.IsReadOnly = $false
                Write-Verbose -Message 'Set file [$($File.FullName)] to writable.'
            } catch {
                Write-Warning -Message 'Failed to set file [$($File.FullName)] to writable.'
            }
        }
    }
    
}