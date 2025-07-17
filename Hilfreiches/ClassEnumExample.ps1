class Vehicle
{
    [string]$Color
    [string]$Manufacturer
    [int]$Seats
    [int]$MaxSpeed
}

class Car : Vehicle
{
    [int]$Tires
    [int]$PS
    [string]$Model
    [Motortyp]$Motortyp

    #Konstruktoren werden "ausgeführt" beim erstellen einer neuen Instanz der Klasse
    Car()
    {
        #Default Kontruktor wenn keine Werte übergeben werden
    }
    #Für jeden einzelnen Fall einen extra Konstruktor anlegen
    Car([string]$Manufacturer)
    {
        $this.Manufacturer = $Manufacturer
    }
    Car([string]$Manufacturer,[string]$Modell)
    {
        $this.Manufacturer = $Manufacturer
        $this.Model = $Modell
    }

    #Klassen können auch Methoden haben
    [void]Drive([int]$Distance)
    {
        [int]$Speed = 0
        [string]$Road = "🚗"
        for($i = 1; $i -le $Distance; $i++)
        {
            $Road = "-" + $Road
            if($Speed -lt $this.MaxSpeed)
            {
                $Speed += 15
            }

            Start-Sleep -Milliseconds (300 - $Speed)
            Clear-Host
            Write-Host -Object $Road
        }
    }

    #Bestehende Standard Methoden überschreiben
    [string]ToString()
    {
        [string]$Return = "[ " + $This.Manufacturer + " : " + $this.Model + " ]"

        return $Return
    }
    [string]ToString([string]$InformationLEvel)
    {
        [string]$Return = ""
        switch($InformationLEvel)
        {
            Detailed {$Return = "[ $($this.Manufacturer) $($this.Model) $($this.Motortyp) $($this.PS)"}
            CSV {$Return = $this | ConvertTo-Csv -NoTypeInformation}
            Default {$Return = $this.ToString()}
        }
        return $Return
    }
}

enum Motortyp
{
    Sonstiges
    Benzin
    Diesel
    Elektrisch
    Hybrid
    Wasserstoff
    Kynetisch
}

$MyCar = [Car]::new("BMW","G21")
$MyCar.Color = "schwarz metalic"
$MyCar.Motortyp = [Motortyp]::Hybrid
$MyCar.MaxSpeed = 260
$MyCar.PS = 252
$MyCar.Seats = 5
$MyCar.Tires = 4