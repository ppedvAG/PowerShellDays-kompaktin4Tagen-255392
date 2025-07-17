@{
    AllNodes = @(
        @{
            NodeName = "Member1"
            WindowsFeatures = @(
                @{
                    Name="Web-Server"
                    Ensure="Present"
                },
                @{
                    Name="Web-mbmt-tools"
                    Ensure= "Present"
                }
             )
          },
         @{
            NodeName = "Member2"
            WindowsFeatures = @(
                @{
                    Name="FS-FileServer"
                    ensure = "Present"
                }
                )
         }
    )
}
