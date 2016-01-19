#Shoutout to https://sandroaspbiztalkblog.wordpress.com/2013/04/04/how-to-configure-sql-server-network-protocols-in-the-sql-server-that-houses-biztalk-server-databases-with-powershell/
#for the script to enable Shared Memory within SQL

[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement")
 
##################################################################
# Function to Enable or Disable a SQL Server Network Protocol
##################################################################
function ChangeSQLProtocolStatus($server,$instance,$protocol,$enable){
 
    $smo = 'Microsoft.SqlServer.Management.Smo.'
 
    $wmi = new-object ($smo + 'Wmi.ManagedComputer')
 
    $singleWmi = $wmi | where {$_.Name -eq $server}
 
    $uri = "ManagedComputer[@Name='$server']/ServerInstance[@Name='$instance']/ServerProtocol[@Name='$protocol']"
 
    $protocol = $singleWmi.GetSmoObject($uri)
 
    $protocol.IsEnabled = $enable
 
    $protocol.Alter()
 
    $protocol
}
 
##################################################################
# Enable TCP/IP SQL Server Network Protocol
##################################################################
#ChangeSQLProtocolStatus -server "BIT9SRV1" -instance "MSSQLSERVER" -protocol "TCP" -enable $true
 
##################################################################
# Enable Named Pipes SQL Server Network Protocol
##################################################################
#ChangeSQLProtocolStatus -server "BIT9SRV1" -instance "MSSQLSERVER" -protocol "NP" -enable $true
 
##################################################################
# Disable Shared Memory SQL Server Network Protocol
##################################################################
ChangeSQLProtocolStatus -server "BIT9SRV1" -instance "BIT9" -protocol "SM" -enable $false
 
##################################################################
# Disable VIA SQL Server Network Protocol
##################################################################
#ChangeSQLProtocolStatus -server "BIT9SRV1" -instance "MSSQLSERVER" -protocol "VIA" -enable $false
