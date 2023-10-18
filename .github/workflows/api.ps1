# Define the API URL and folder name
$apiUrl = "https://reqres.in/api/users?page=2"
$apiFolderName = "respones"

# Create the API folder if it doesn't exist
if (-not (Test-Path -Path $apiFolderName -PathType Container)) {
    New-Item -ItemType Directory -Path $apiFolderName
}

# Make the API request and save the response as a JSON file
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Define the file path to save the response
$responseFilePath = Join-Path -Path $apiFolderName -ChildPath "response.json"

# Convert the response to JSON and save it to the file
$response | ConvertTo-Json | Set-Content -Path $responseFilePath

# Commit and push the changes to your GitHub repository
git add .
git commit -m "Add API responses for $apiFolderName"
git push origin master  # Replace "master" with your branch name

# Output a success message
Write-Host "API response saved and pushed to GitHub."
 
