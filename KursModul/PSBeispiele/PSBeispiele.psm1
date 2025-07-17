function Test-Pipelineübergabe
{
[cmdletBinding()]
param(
    [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$Name,

    [Parameter(ValueFromPipelineByPropertyName = $true)]
    [string]$Status = ""
)

Write-Host -Object "$Name : $Status"


}

function Test-BeginProccessEnd
{
[cmdletBinding()]
param(
    [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$Name,

    [Parameter(ValueFromPipelineByPropertyName = $true)]
    [string]$Status = ""
)

Begin
{
    Write-Verbose -Message "Wird einmal am Start ausgeführt"
}
Process
{
    Write-Verbose -Message "Wird für jedes übergebene Objekt ausgeführt"
    Write-Host -Object "$Name : $Status"
}
End
{
    Write-Verbose -Message "Wird einmal am Schluss ausgeführt"
}


}