$installDir = "$env:USERPROFILE\bin"
$scriptUrl = "https://raw.githubusercontent.com/Badr-1/git-tutor/main/git-tutor"
$scriptPath = "$installDir\git-tutor"

# Ensure the install directory exists
if (!(Test-Path -Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Download the script
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# Make it executable
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
icacls $scriptPath /grant "$env:USERNAME:F"

# Add to PATH if necessary
$path = [System.Environment]::GetEnvironmentVariable("Path", "User")
if ($path -notlike "*$installDir*") {
    [System.Environment]::SetEnvironmentVariable("Path", "$installDir;$path", "User")
}

Write-Output "Installation complete! Restart your terminal and run 'git tutor'."
