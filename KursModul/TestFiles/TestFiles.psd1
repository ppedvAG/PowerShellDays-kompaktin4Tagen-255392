#
# Modulmanifest für das Modul "TestFiles"
#
# Generiert von: Administrator
#
# Generiert am: 16.07.2025
#

@{

# Die diesem Manifest zugeordnete Skript- oder Binärmoduldatei.
RootModule = 'Skriptmodul.psm1'

# Die Versionsnummer dieses Moduls
ModuleVersion = '1.0'

# Unterstützte PSEditions
# CompatiblePSEditions = @()

# ID zur eindeutigen Kennzeichnung dieses Moduls
GUID = '99c5751e-718a-40b8-9254-70106058f1eb'

# Autor dieses Moduls
Author = 'Stefan Ober'

# Unternehmen oder Hersteller dieses Moduls
CompanyName = 'ppedv AG'

# Urheberrechtserklärung für dieses Modul
Copyright = '(c) 2025 Stefan Ober (ppedv AG). Alle Rechte vorbehalten.'

# Beschreibung der von diesem Modul bereitgestellten Funktionen
# Description = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
PowerShellVersion = '5.0'

# Der Name des für dieses Modul erforderlichen Windows PowerShell-Hosts
# PowerShellHostName = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Hosts
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. Diese Voraussetzung gilt nur für die Desktop-Edition von PowerShell.
DotNetFrameworkVersion = '4.6'

# Minimum version of the common language runtime (CLR) required by this module. Diese Voraussetzung gilt nur für die Desktop-Edition von PowerShell.
# CLRVersion = ''

# Die für dieses Modul erforderliche Prozessorarchitektur ("Keine", "X86", "Amd64").
ProcessorArchitecture = 'Amd64'

# Die Module, die vor dem Importieren dieses Moduls in die globale Umgebung geladen werden müssen
# Diese Module können einfach als Modulname als String angegeben werden, oder als Hashtable mit den Schlüsseln "ModuleName" und "ModuleVersion", "MaximumVersion","Guid". Einzig Mandatory ist der Modulname
RequiredModules = @(
                        @{
                            ModuleName = 'Microsoft.PowerShell.Management'
                            ModuleVersion = '3.1.0.0'
                        }
                    )

# Die Assemblys, die vor dem Importieren dieses Moduls geladen werden müssen
# RequiredAssemblies = @()

# Die Skriptdateien (PS1-Dateien), die vor dem Importieren dieses Moduls in der Umgebung des Aufrufers ausgeführt werden.
# ScriptsToProcess = @()

# Die Typdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# TypesToProcess = @()

# Die Formatdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# FormatsToProcess = @()

# Die Module, die als geschachtelte Module des in "RootModule/ModuleToProcess" angegebenen Moduls importiert werden sollen.
# NestedModules = @()

# Aus diesem Modul zu exportierende Funktionen. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Funktionen vorhanden sind.
# Skriptmodule können nur Funktionen exportieren und keine cmdlets. Verwenden Sie daher "FunctionsToExport" anstelle von "CmdletsToExport".
FunctionsToExport = @("New-TestFilesDir")

# Aus diesem Modul zu exportierende Cmdlets. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Cmdlets vorhanden sind.
CmdletsToExport = @()

# Die aus diesem Modul zu exportierenden Variablen
VariablesToExport = '*'

# Aus diesem Modul zu exportierende Aliase. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Aliase vorhanden sind.
AliasesToExport = @()

# Aus diesem Modul zu exportierende DSC-Ressourcen
# DscResourcesToExport = @()

# Liste aller Module in diesem Modulpaket
# ModuleList = @()

# Liste aller Dateien in diesem Modulpaket
# FileList = @()

# Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul übergeben werden sollen. Diese können auch eine PSData-Hashtabelle mit zusätzlichen von PowerShell verwendeten Modulmetadaten enthalten.
PrivateData = @{

    PSData = @{

        # 'Tags' wurde auf das Modul angewendet und unterstützt die Modulermittlung in Onlinekatalogen.
        # Tags = @()

        # Eine URL zur Lizenz für dieses Modul.
        # LicenseUri = ''

        # Eine URL zur Hauptwebsite für dieses Projekt.
        # ProjectUri = ''

        # Eine URL zu einem Symbol, das das Modul darstellt.
        # IconUri = ''

        # 'ReleaseNotes' des Moduls
        # ReleaseNotes = ''

    } # Ende der PSData-Hashtabelle

} # Ende der PrivateData-Hashtabelle

# HelpInfo-URI dieses Moduls
# HelpInfoURI = ''

# Standardpräfix für Befehle, die aus diesem Modul exportiert werden. Das Standardpräfix kann mit "Import-Module -Prefix" überschrieben werden.
# DefaultCommandPrefix = ''

}

