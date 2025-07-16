param(
[ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(1,99)]
[int]$FileCount = 5,

[ValidateRange(1,99)]
[int]$DirCount = 5,

[Validatelength(1,20)]
[string]$DirName = "TestFiles2",

[switch]$Force
)
#Beginn Funktionsdeklaration
function New-TestFiles
{
    [cmdletBinding()]
    param(
    [ValidateScript({Test-Path -Path $PSItem -Pathtype Container})]
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [ValidateRange(1,99)]
    [int]$FileCount = 9,

    [Validatelength(1,20)]
    [string]$FileBaseName = "File"
    )

    for($i = 1; $i -le $FileCount; $i++)
    {
        $filenr = "{0:D3}" -f $i
        $filename = "$FileBaseName$filenr.txt"

        New-Item -Path $Path -Name $filename -ItemType File
    }
}
#Ende Funktionsdeklaration
$TestDirPath = Join-Path -Path $Path -ChildPath $DirName

if(Test-Path -Path $TestDirPath -PathType Container)
{ #Prüfen ob Ordner vorhanden ansonsten warnung oder löschen bei force
    if($force)
    {
        Remove-Item -Path $TestDirPath -Force -Recurse
    }
    else
    {
        Write-Error -ErrorAction Stop -Message "Ordner bereits vorhanden" -TargetObject (Get-Item -Path $TestDirPath)
    }
}

$TestFilesDir = New-Item -Path $Path -Name $DirName -ItemType Directory

New-TestFiles -Path $TestFilesDir.FullName -FileCount $FileCount 
<# Ersetzt durch vorhergehenden Funktionsaufrug
for($i = 1; $i -le $FileCount; $i++)
{
    $filenr = "{0:D3}" -f $i
    $filename = "Datei$filenr.txt"

    New-Item -Path $TestFilesDir.FullName -Name $filename -ItemType File
}#>

for($i = 1; $i -le $DirCount ; $i++)
{
    $dirnr = "{0:D3}" -f $i
    $Dirname = "Dir$dirnr"

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    New-TestFiles -Path $subdir.FullName -FileBaseName "$Dirname-File" -FileCount $FileCount
    <# Ersetzt durch Funktion New-TestFiles
    for($j = 1; $j -le $FileCount; $j++)
    {
        $filenr = "{0:D3}" -f $j
        $filename = "Datei$filenr.txt"

        New-Item -Path $subdir.FullName -Name $filename -ItemType File
    }
    #>
}