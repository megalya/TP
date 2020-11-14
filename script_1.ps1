#Script qui retourne un résumé de OS 

#INfo de l'os
$OSInfo = Get-WmiObject Win32_OperatingSystem | Select Caption, Version, CSName


#get pour la ram et la date d'allumage
$RAMinfo = Get-CIMInstance Win32_OperatingSystem | Select FreePhysicalMemory,LastBootUpTime
$cs = get-wmiobject -class "Win32_ComputerSystem"
$Mem = [math]::Ceiling($cs.TotalPhysicalMemory / 1024 / 1024 / 1024)
$ramfree = $RAMinfo.FreePhysicalMemory * 1.0E-6


#IP principale 
$IPAddress = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object {$_.Ipaddress.length -gt 1} 
$ipout = 'ip : '+$IPAddress.ipaddress[0]


#Nom de la machine
$name = 'Name : '+ $OSInfo.CSName


#OS name + version
$OSname = 'OS : '+ $OSInfo.Caption
$OSversion = 'Version : ' + $OSInfo.Version


#Date allumage
$date = 'Up since : '  +$RAMinfo.LastBootUpTime


#write tout
Write-Output $ipout,$name,$OSname,$OSversion,$date


#ram usagée
$memory1 = $Mem - $ramfree
$usedram = 'Used : ' + $memory1 + ' Gi'

#ram libre
$freeram = 'Free : ' + $ramfree + ' Gi'
Write-Output $usedram,$freeram


#espace disque
$disk = Get-WmiObject Win32_LogicalDisk -ComputerName localhost -Filter "DeviceID='C:'" |
Select-Object Size,FreeSpace
$usedisk = $disk.Size - $disk.FreeSpace
$convused = 'Used : ' + [math]::Ceiling($usedisk / 1024 / 1024 / 1024) + 'G'

$freedisk = 'Free : ' + [math]::Ceiling($disk.FreeSpace / 1024 / 1024 / 1024) + 'G'
Write-Output $convused,$freedisk


#os update
$updatechecker = Get-Command -Module WindowsUpdateProvider Start-WUScan -SearchCriteria "IsInstalled=0 AND IsHidden=0 AND IsAssigned=1"

If ($updatechecker)
{
    $sortietrue = 'OS Up to date : ' + 'true' 
    Write-Output $sortietrue
}
Else
{
    $sortiefalse = 'OS Up to date : ' + 'false' 
    Write-Output $sortiefalse
}

#ping ( 10.33.3.253 )
$rep_time = (Test-Connection -ComputerName "8.8.8.8" -Count 1  | measure-Object -Property ResponseTime -Average).average
$ping = 'ping :' +  $rep_time + 'ms'
Write-Output $ping

#usersname
$USERS = Get-WmiObject Win32_UserAccount -Filter "LocalAccount=True" | Select-Object -ExpandProperty Name
Write-Output 'users list : ' $USERS

