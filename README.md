# Bit9 Application Server and SQL Server Install
Installs Bit9 Server onto Windows Server 2012 R2 with SQL Server 2012

## Install Pre-requisite Software for Bit9 Parity Server

* Open Powershell and execute `.\bit9install.ps1`

## Edit Configuration File

* Edit `ConfigurationFile.ini` and remove ; from lines 170 and 214
* Add your DOMAIN\administrator group to MS SQL

## Install SQL Server

* Extract SQL executable and `CD` to the directory
* Locate ConfigurationFile.ini and note the path
* Run `setup.exe /ConfigurationFile=ConfigurationFile.ini /SAPWD=“password123”`

## Enable Shared Memory

* Edit `EnableSharedMemory.ps1' specifically `ChangeSQLProtocolStatus -server "BIT9SRV1" -instance "BIT9" -protocol "SM" -enable $true` and change BIT9SRV1 to your server name (not FQDN)
