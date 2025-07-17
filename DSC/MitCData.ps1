configuration MyWebwithCD
{
    Node $AllNodes.NodeName
    {
        LocalConfigurationManager
        {
            #Apply, ApplyAndMonitor, ApplyAndAutoCorrect
            ConfigurationMode = "ApplyAndAutoCorrect"
            ConfigurationModeFrequencyMins = 20
        }
        foreach($Feature in $Node.WindowsFeatures)
        {
            WindowsFeature $Feature.Name
            {
                Name = $Feature.Name
                Ensure = $Feature.Ensure     
            }       
        }    
    }
}

MyWebwithCD -OutputPath C:\KursRepo\DSC\ConfigurationData\ -ConfigurationData C:\KursRepo\DSC\MitCData.psd1

Start-DscConfiguration -Wait -Verbose -Path C:\KursRepo\DSC\ConfigurationData\
Set-DscLocalConfigurationManager -Path C:\KursRepo\DSC\ConfigurationData\