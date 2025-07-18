# PowerShellDays-kompaktin4Tagen-255392
KursRepository zu Kurs PowerShell Days - kompakt in 4 Tagen der ppedv AG

[Kursblatt PowerDays](https://ppedv.de/schulung/kurse/WindowsPowerShellCorecmdletScriptWMIlernenFortgeschrittenWorkflowProgrammierungSeminarTraining?affid=PNXYL )

[Kursblatt 1. Teil](https://ppedv.de/schulung/kurse/PowershellAdministrationWindowslWMIActiveDirectoryIIS7cmdletspipelinesPs1Skripte?affid=PNXYL)
### Agenda:
- Einführung
    - PowerShell Versionen
        - **5**, 6, 7
    - Anwendungen
        - Shell
        - ISE
        - Terminal (ab Windows11 default, ansonsten nachinstallierbar)
- Hilfe zur Selbsthilfe
  ```powershell 
  Get-Help
  Get-Command
  Get-Member
  ```
  - Verwendung von -WhatIf / -Confirm
    - WhatifPreference
    - ConfirmPreference
- cmdlet
    - Aufbau Verb-Noun
- Module
- Variablen
- Operationen
- PipeLine1
- Formatierung  der Ausgabe mit
    ```powershell
    Format-Tabe
    Format-List
    Format-Wide
    ```
- Einfache Ausgabe
    ```powershell
    Out-Host
    Out-File
    Out-Printer
    ```
- PipeLine1
- Sortieren 
- Messen
- Selektieren
- Konvertieren / Importieren / Exportieren
- Filtern
- Aufzählen
- Schleifen
- Verzweigung
- Pipeline2
- Variablen2
- Skriptsicherheit
- Scripting
    - Parameter
    - Parametervalidierung
    

[Kursblatt 2. Teil](https://ppedv.de/schulung/kurse/PowerShellCorecmdletScriptlernenFortgeschrittenWorkflowProgrammierungSeminarTraining?affid=PNXYL )

### Agenda Teil 2:
- Git
- Verbose
- Debug
- Comment Based Help
- Validates
    - Validatelength
    - ValidateRange
    - ValidatePattern
    - ValidateScript
- Scripting
    - Functions
    - Tips
- Skript Module
    - ModuleManifest
- Fehlerbehandlung
    - Try/Catch/Finally
    - ErrorAction
    - ErrorVariable
- Pipelinefähigkeit
- Beginn Process End
- ParameterSet
- PositionalBinding
- Advanced Parameter
- cmdletBinding
- Credential als Parameter
- DSC
- DSC with ConfigurationData
- Class
- Enum
- .Net Assemblies in PowerShell nutzen
  - System.Speech