﻿function Test-Pipelineübergabe
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
        class LineStringStat
        {
            [double]$LineNr
            [double]$WortCount
            [double]$ZeichenCount
        }
        class StringStat
        {
            [LineStringStat[]]$lines
            [double]$GesamtWortCount
            [double]$GesamtZeichenCount
        }
        [double]$LineCount = 0
        <#
        [double]$WortCount = 0
        [double]$ZeichenCount = 0

        [double]$GesamtWortCount = 0
        [double]$GesamtZeichenCount = 0
        #>

        $Ausgabe = [StringStat]::new()
    }
    Process
    {
        $LineCount ++
        $Line = [LineStringStat]::new()
        $Line.LineNr = $LineCount
        
        $Line.Zeichencount = $InputObject.Replace(" ","").Length;
        if( $Line.Zeichencount -gt 0)
        {
            $Line.WortCount = $InputObject.Split(" ").Count 
        }
        else
        {
            $Line.WortCount = 0
        }
        $Ausgabe.lines += $Line
        $Ausgabe.GesamtWortCount += $Line.WortCount
        $Ausgabe.GesamtZeichenCount += $Line.Zeichencount
    }
    End
    {
        $Ausgabe
    }

}

function Test-ParameterSet
{
#Die Eigenschaft DaufaltparameterSetName im cmdletBinding setzt das Default ParameterSet, das die PowerShell weiß von welchem Set standardmäßig die Mandatory abgefragt werden müssen wenn kein Parameter angegeben wurde
[cmdletBinding(DefaultParameterSetName="Set1")]
param(
    [Parameter(ParameterSetName="Set1", Mandatory=$true)]
    [string]$Input1,

    [Parameter(ParameterSetName="Set2", Mandatory=$true)]
    [string]$Input2,

    [Parameter(ParameterSetName="Set1", Mandatory=$false)]
    [Parameter(ParameterSetName="Set2", Mandatory=$true)]
    [string]$Input3
)
# $PSCmdlet.ParameterSetName beeinhaltet das verwendete ParameterSet
Write-Host -Object "ParametersetName: $($PSCmdlet.ParameterSetName)"
Write-Host -Object $Input1 
Write-Host -Object $Input2
Write-Host -Object $Input3

}

function Test-PositionalBinding
{
<#
.SYNOPSIS
    Test PositionalBinding
.DESCRIPTION
    Test- 
#>
[cmdletBinding(PositionalBinding = $false)]
param(
    $input1,
    [Parameter(Position=1)]
    $input2,
    [Parameter(Position=2)]
    $input3
)

Write-Host -Object $Input1 
Write-Host -Object $Input2
Write-Host -Object $Input3
}

function Test-ConfirmImpact
{#Todo
[cmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]
param(
[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
[string]$Name
)
Write-Host -Object $Name
}


function Test-Remaining
{
[cmdletBinding()]
param(
    [Parameter(Mandatory= $true, ValueFromPipeLine = $true, ValueFromPipelineByPropertyName = $true)]
    [Alias("Bezeichnung")]
    [string]$Name,

    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Remaining
)
    Write-Verbose -Message "Habe verbleibend Elemente gefunden $($Remaining.Count)"
    $Remaining | ForEach-Object -Process {$PSItem}

}

function Test-CredentialParam
{
    [cmdletBinding()]
    param(
    [ValidateNotNull()]
    [System.Management.Automation.PSCredential]
    [System.Management.Automation.Credential()]
    $Credential
    )
}