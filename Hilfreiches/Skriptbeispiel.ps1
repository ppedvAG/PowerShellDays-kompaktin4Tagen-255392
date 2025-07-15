# Dieses Skript liest bestimmte Security-Events aus dem Windows-Eventlog aus.
# Es kann lokal oder auf einem entfernten Computer ausgeführt werden.

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

# Holt die Security-Events vom angegebenen Computer, filtert nach EventId und gibt die neuesten Einträge aus.
Get-WinEvent -LogName Security -ComputerName $computername | Where-Object Id -eq $EventId | Select-Object -First $Newest

