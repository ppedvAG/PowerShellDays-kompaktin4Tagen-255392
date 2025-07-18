# Skript Beispiel

```powershell
# Definieren von Parametern für das Skript
param(
    # EventId ist ein Pflichtparameter (Mandatory=$true), der die Ereignis-ID angibt, nach der gefiltert werden soll
    [Parameter(Mandatory=$true)]
    [string]$EventId,

    # Newest ist ein optionaler Parameter, der die Anzahl der neuesten Ereignisse angibt (Standardwert: 5)
    [int]$Newest = 5,

    # ComputerName ist ein optionaler Parameter, der den Zielcomputer angibt (Standardwert: "localhost")
    [string]$ComputerName = "localhost"
)

# Ausgabe von zusätzlichen Informationen, wenn der Verbose-Modus aktiviert ist
Write-Verbose -Message "Zusätzliche Optionale Ausgabe"
Write-Verbose -Message "$EventId $Newest $ComputerName"

# Abrufen der Ereignisprotokolle aus dem Sicherheitsprotokoll des angegebenen Computers
# Filtern nach der angegebenen EventId und Auswählen der neuesten Ereignisse basierend auf dem Parameter Newest
Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest
```
