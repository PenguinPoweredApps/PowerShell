# Install-Module -Name Posh-SSH -Scope CurrentUser

# Import the Posh-SSH module
Import-Module Posh-SSH

# Define SFTP server credentials
$server = "your.sftp.server.com"
$port = 22
$username = "your_username"
$password = ConvertTo-SecureString "your_password" -AsPlainText -Force

# Create a credential object
$credential = New-Object System.Management.Automation.PSCredential ($username, $password)

# Establish the SFTP connection
$sftp = New-SFTPSession -ComputerName $server -Port $port -Credential $credential

# Check if the SFTP session is connected
if ($sftp.IsConnected) {
    # Define the local file path and the remote directory
    $localFilePath = "C:\path\to\your\local\file.txt"
    $remoteDirectory = "/path/to/your/remote/directory/"

    # Upload the file
    Set-SFTPFile -SessionId $sftp.SessionId -LocalFile $localFilePath -RemotePath $remoteDirectory

    # Disconnect the SFTP session
    Remove-SFTPSession -SessionId $sftp.SessionId
}
else {
    Write-Host "Failed to connect to $server."
}
