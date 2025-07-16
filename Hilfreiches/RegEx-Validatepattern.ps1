[cmdletBinding()]
param(
    [ValidatePattern("[0-9]{4}[-][0-9]{2}[-][0-9]{2}[_][a-z]{5}[.](csv)")]
    [string]$FileName
)

Write-Host -Object $FileName -ForegroundColor Green