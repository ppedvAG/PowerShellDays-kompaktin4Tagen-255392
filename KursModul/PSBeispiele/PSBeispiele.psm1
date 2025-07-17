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

function Get-StringStats
{
[cmdletBinding()]
param(
    [Parameter(ValueFromPipeLine = $true)]
    [Validatelength(0,2147483647)]
    [string]$InputObject
)

    Begin
    {
        [double]$WortCount = 0
        [double]$ZeichenCount = 0
        [double]$LineCount = 0

        [double]$GesamtWortCount = 0
        [double]$GesamtZeichenCount = 0
    }
    Process
    {
        $LineCount ++
        $ZeichenCount = $InputObject.Replace(" ","").Length;
        if($ZeichenCount -gt 0)
        {
            $WortCount = $InputObject.Split(" ").Count 
        }
        else
        {
            $WortCount = 0
        }
        "Input$LineCount : Zeichen: $ZeichenCount Wörter: $WortCount"

        $GesamtWortCount += $WortCount
        $GesamtZeichenCount += $ZeichenCount
    }
    End
    {
        "Zusammenfassung:"
        "Zeilen: $Linecount"
        "Gesamt Wörter: $GesamtWortCount"
        "Gesamt Zeichen $GesamtZeichenCount"
    }

}