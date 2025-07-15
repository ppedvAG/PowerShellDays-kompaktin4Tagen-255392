param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 3,

[ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTcpPort WinRm -InformationLevel Quiet})]
[string]$computername = "localhost"
)

Get-WinEvent -LogName Security -ComputerName $computername | Where-Object Id -eq $EventId | Select-Object -First $Newest

