# Install-Module -Name PowerHTML -Scope CurrentUser

# Import the PowerHTML module
Import-Module PowerHTML

# Define a function for web scraping
function Scrape-Website {
    param(
        [string]$url
    )

    # Initialize log file
    $logFile = "scrape_log.txt"

    try {
        # Fetch the web page
        $response = Invoke-WebRequest -Uri $url -TimeoutSec 30
    }
    catch {
        Write-Host "Error fetching the URL: $url"
        Add-Content -Path $logFile -Value "Error fetching the URL: $url"
        return
    }

    # Check for empty response
    if (-not $response) {
        Write-Host "Received empty response for URL: $url"
        Add-Content -Path $logFile -Value "Received empty response for URL: $url"
        return
    }

    # Use PowerHTML to parse the HTML content
    $parsedHtml = ConvertFrom-Html -Html $response.Content

    # Initialize an array to hold the scraped data
    $scrapedData = @()

    # Loop through each anchor tag to extract text and href attributes
    foreach ($tag in $parsedHtml.Find("a")) {
        $text = $tag.InnerText
        $href = $tag.GetAttribute('href')

        # Create a custom object to hold this set of data
        $obj = [PSCustomObject]@{
            Text = $text
            Link = $href
        }

        # Add the object to our array
        $scrapedData += $obj
    }

    # Output the scraped data
    $scrapedData | Format-Table -AutoSize

    # Optional: Write scraped data to log
    $scrapedData | Out-File -FilePath $logFile -Append
}

# Call the function with your own URL
Scrape-Website -url "http://your-own-website.com"
