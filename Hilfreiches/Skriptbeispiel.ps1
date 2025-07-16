[cmdletBinding()]
param(
    # Pflichtparameter: EventId muss angegeben werden und darf nur 4624, 4625 oder 4634 sein.
    [Parameter(Mandatory=$true)]
    [ValidateSet(4624,4625,4634)]
    [int]$EventId,

    # Optionaler Parameter: Gibt an, wie viele Einträge angezeigt werden (zwischen 5 und 10, Standard ist 3).
    [ValidateRange(5,10)]
    [int]$Newest = 3,

    # Optionaler Parameter: Computername, auf dem gesucht werden soll (Standard: localhost).
    # Es wird geprüft, ob der Computer per WinRM erreichbar ist.
    [ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTcpPort WinRm -InformationLevel Quiet})]
    [string]$computername = "localhost"
)

Write-Verbose -Message "Zusätzliche optionale Ausgaben"
Write-Verbose -Message "Vom User wurden folgende Werte übergeben"
Write-Verbose -Message "EventId: $EventId"
Write-Verbose -Message "Newest: $Newest"
Write-Verbose -Message "Computername: $computername"

Write-Debug -Message "Vor der Abfrage"

# Holt die Security-Events vom angegebenen Computer, filtert nach EventId und gibt die neuesten Einträge aus.
Get-WinEvent -LogName Security -ComputerName $computername | Where-Object Id -eq $EventId | Select-Object -First $Newest

