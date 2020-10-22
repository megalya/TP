# script qui shutdown et lock le pc

$func = $args[0]
$time = $args[1]

If ($func -eq 'lock')
{
Start-Sleep -Seconds $time
rundll32.exe user32.dll,LockWorkStation

}
ElseIf ($func -eq 'shutdown')
{
Start-Sleep -Seconds $time
Get-CimInstance -Classname Win32_OperatingSystem | Invoke-CimMethod -MethodName Shutdown
}
Else
{
Write-Output "Erreur"
}