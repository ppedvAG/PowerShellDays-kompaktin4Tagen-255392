configuration myWebServer
{
    # Zum Abrufen der Knotenliste können Ausdrücke ausgewertet werden.
    # Beispiel: $AllNodes.Where("Role -eq Web").NodeName
    node ("Member1")
    {
        # Ressourcenanbieter aufrufen
        # Beispiel: WindowsFeature, File
        WindowsFeature WebSvrRolle
        {
           Ensure = "Present"
           Name   = "Web-Server"
        }

        Service WWW-Dienst
        {
            Name= "w3svc"
            StartUpType = "Automatic"   
        }

        Group WebAdmins
        {
            Ensure = "Present"
            Groupname = "WebAdministrators"
        }
    
    }
}
myWebServer -OutputPath C:\KursRepo\DSC\simple.mof
Start-DscConfiguration -Wait -Verbose -Path C:\KursRepo\DSC\simple.mof
