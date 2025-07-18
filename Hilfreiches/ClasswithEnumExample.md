# PowerShell-Klassen und Enums

## Einleitung
PowerShell bietet die Möglichkeit, Klassen und Enums zu erstellen, um objektorientierte Konzepte wie Eigenschaften, Methoden und Konstruktoren zu nutzen. Diese Funktionalität eignet sich ideal, um eigene Objekte zu erstellen für die Ausgabe von Daten oder als DTO (Data Transfer Object) um Daten an ein anderes Skript oder cmdlet zu übergeben.

---
## Definition einer Klasse: `Fahrzeug`
Die Klasse `Fahrzeug`defniert die grundlegenden Eigenschaften die jedes Fahrzeug hat. Egal ob es sich um ein Straßenfahrzeug oder Wasserfahrzeug handelt.
```powershell
class Fahrzeug
{
    [string]$Farbe
    [string]$Hersteller
    [int]$Sitzplätze
}
```

## Definition einer Klasse: `Auto`
Die Klasse `Auto` repräsentiert ein Fahrzeug mit spezifischen Eigenschaften und Methoden, die Eigenschaften die bereits von der Klasse `Fahrzeug` defniert wurde, müssen nicht neu angegeben werden.

```powershell
class Auto : Fahrzeug
{
    [int]$Räder
    [string]$Model
    [int]$Leistung
    [Antrieb]$Betriebsstoff
    [int]$Höchstgeschwndigkeit

    #Konstruktor
    #Der Konstruktor wird ausgeführt bzw kann ausgeführt werden beim erstellen einer Instanz der Klasse
    #Der Konstruktor hat den gleichen Namen wie die Klasse
    #Es kann mehrere Konstruktoren gebene für verschiedene Anwendungsfälle.
    Auto()
    {

    }
    #Dieser Konstruktor kann genutzt werden um beim erstellen der Instanz bereits den Hersteller mitzugeben.
    Auto([string]$Hersteller)
    {
        $this.Hersteller = $Hersteller
    }
    #Dieser Konstruktor kann genutzt werden um beim erstellen der Instanz bereits den Hersteller und die Marke mitzugeben.
    Auto([string]$Marke,[string]$Model)
    {
        $this.Marke = $Marke
        $this.Model = $Model
    }

    #Methoden brauchen immer einen Rückgabewert, wenn keine Rückgabe vorgesehen ist [void]
    [void]Fahre([int]$Strecke)
    {
        [int]$Speed = 0
        [string]$Fahrbahn = "🚗"
        for($i = 1; $i -le $Strecke; $i++)
        {
            $Fahrbahn = "-" + $Fahrbahn
            if($Speed -le $this.Höchstgeschwndigkeit)
            {
                $Speed += 15
            }

            Start-Sleep -Milliseconds (300 - $Speed)
            Clear-Host
            Write-Host -Object $Fahrbahn
        }
    }


    #es ist mögliche bestehende Methoden zu überschreiben / überlagern wie hier zb. To String
    [string]ToString()
    {
        [string]$Ausgabe = "[ "+ $this.Hersteller + " " + $this.Model + " ]"
        return $Ausgabe
    }

    [string]ToSTring([string]$Informationlevel)
    {
        [string]$Ausgabe = ""
        switch($Informationlevel)
        {
            Detailed {$Ausgabe = "[ " + $this.Hersteller + " | " + $this.Model + " Leistung: " + $this.PS + " PS " + "( $($this.Betriebsstoff))" +  "]"}
            Default {$Ausgabe = $this.ToString()}
        }

        return $Ausgabe
    }
    # Oder wie hier mit ToJson
    [string]ToJSon()
    {
        return ($this | ConvertTo-Json)
    }

}
```

### Eigenschaften der Klasse `Auto`
1. **`[string]$Hersteller`**: Speichert den Hersteller des Autos (z. B. Mercedes).
2. **`[string]$Model`**: Speichert das Modell des Autos (z. B. C-Klasse).
3. **`[string]$Leistung`**: Speichert die Leistung des Autos (z. B. "280PS").
4. **`[Antriebsart]$Antrieb`**: Verwendet den Enum `Antriebsart`, um die Antriebsart zu definieren (z. B. Benzin, Diesel).
5. **`hidden [string]$versteckt`**: Eine versteckte Eigenschaft, die nur mit dem Befehl `Get-Member -Force` angezeigt wird.

### Methoden der Klasse `Auto`
- **`SetMarke([string]$Marke)`**: Setzt die Marke des Autos.
- **`ToString()`**: Überschreibt die Standard-Methode `ToString()` und gibt eine kombinierte Darstellung von Marke und Modell zurück.
- **`ToJSon()`**: Wandelt das Auto-Objekt in ein JSON-Format um.

### Konstruktoren der Klasse `Auto`
- **`Auto()`**: Standard-Konstruktor, der keine Parameter erwartet.
- **`Auto([string]$Marke)`**: Konstruktor, der die Marke als Parameter setzt.
- **`Auto([string]$Marke,[string]$Model)`**: Konstruktor, der Marke und Modell gleichzeitig setzt.

---

## Definition eines Enums: `Antriebsart`
Ein Enum ist ein spezieller Datentyp, der eine Liste von benannten Konstanten definiert. Hier ist das Enum `Antriebsart` definiert für Standardisierte Werte:

```powershell
enum Antriebsart
{
    Undefined
    Elektrisch
    Hybrid
    Benzin
    Diesel
}
```

### Beschreibung des Enums `Antriebsart`
- **`Undefined`**: Standardwert, wenn keine Antriebsart angegeben ist.
- **`Elektrisch`**: Elektroantrieb.
- **`Hybrid`**: Kombination aus Elektro- und Verbrennungsmotor.
- **`Benzin`**: Benzinantrieb.
- **`Diesel`**: Dieselantrieb.

---

## Verwendung der Klasse und des Enums
Hier sind Beispiele, wie die Klasse `Auto` und der Enum `Antriebsart` verwendet werden können:

### Beispiel 1: Erstellen eines Mercedes-Objekts
```powershell
$Mercedes = [Auto]::new("Mercedes")
$Mercedes.Modell = "C-Klasse"
$Mercedes.Leistung = "280PS"
```
- Erstellt ein `Auto`-Objekt mit der Marke "Mercedes".
- Setzt das Modell auf "C-Klasse" und die Leistung auf "280PS".

### Beispiel 2: Erstellen eines BMW-Objekts
```powershell
$BMW = [Auto]::new("BMW","F31")
```
- Erstellt ein `Auto`-Objekt mit der Marke "BMW" und dem Modell "F31".

---

## Vorteile der Verwendung von Klassen und Enums
1. **Objektorientierung**: Ermöglicht die Modellierung von Daten mit spezifischen Eigenschaften und Verhalten.
2. **Flexibilität**: Konstruktoren erlauben eine vielseitige Initialisierung von Objekten.
3. **Strukturierte Datentypen**: Enums sorgen für klar definierte Wertebereiche.
4. **Wiederverwendbarkeit**: Klassen können in verschiedenen Szenarien wiederverwendet werden.
5. **Lesbarkeit**: Code wird durch die Verwendung von Klassen und Enums leichter verständlich.

---


