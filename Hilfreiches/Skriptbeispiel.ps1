<#
.SYNOPSIS
 Kurzbeschreibung des Skriptes
.DESCRIPTION
 Meine sehr lange Beschreibung des Skriptes
.PARAMETER EventId
 Pflichtparameter: EventId muss angegeben werden und darf nur 4624, 4625 oder 4634 sein.

 4624 : Anmeldung
 4625 : Fehlgeschlagene Anmeldung
 4634 : Abmeldung
.PARAMETER Newest
 Optionaler Parameter: Gibt an, wie viele Einträge angezeigt werden (zwischen 5 und 10, Standard ist 3).
.PARAMETER Computername
 Optionaler Parameter: Computername, auf dem gesucht werden soll (Standard: localhost).
 Es wird geprüft, ob der Computer per WinRM erreichbar ist.
.NOTES
 Zusätzliche Infos zum Skript
.EXAMPLE
 Skriptbeispiel.ps1 -EventId 4624


   ProviderName: Microsoft-Windows-Security-Auditing

TimeCreated                     Id LevelDisplayName Message
-----------                     -- ---------------- -------
16.07.2025 13:10:03           4624 Informationen    Ein Konto wurde erfolgreich angemeldet..
16.07.2025 13:09:03           4624 Informationen    Ein Konto wurde erfolgreich angemeldet..
16.07.2025 13:08:03           4624 Informationen    Ein Konto wurde erfolgreich angemeldet..
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#comment-based-help-keywords
#>
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet(4624,4625,4634)]
    [int]$EventId,

    [ValidateRange(5,10)]
    [int]$Newest = 3,

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

