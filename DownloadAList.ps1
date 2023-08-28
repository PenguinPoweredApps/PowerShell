# Define list of software to download and install
$softwareList = @(
    @{
        "url" = "https://example.com/software1.exe"
        "installCommand" = "software1.exe /S"
    },
    @{
        "url" = "https://example.com/software2.exe"
        "installCommand" = "software2.exe /S"
    }
)

# Loop through each software in the list
foreach ($software in $softwareList) {
    # Download software
    $downloadPath = "C:\Path\To\Downloads\" + ($software.url).Split('/')[-1]
    Invoke-WebRequest -Uri $software.url -OutFile $downloadPath

    # Install software
    Start-Process -FilePath "$downloadPath" -ArgumentList $software.installCommand -Wait
}
