function Map-NetworkDrive {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DriveLetter,
        [Parameter(Mandatory=$true)]
        [string]$SharePath,
        [string]$Username,
        [string]$Password
    )

    $credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, (ConvertTo-SecureString $Password -AsPlainText -Force)
    New-PSDrive -Name $DriveLetter -PSProvider FileSystem -Root $SharePath -Credential $credentials -Persist
}
