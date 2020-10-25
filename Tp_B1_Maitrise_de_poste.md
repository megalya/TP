# Self-footprinting 
## Host OS

J'ai utilisé la commande ``systeminfo`` pour afficher les 4 données demandées
* nom de la machine : DESKTOP-LCCJJQ8
* OS et version : Microsoft Windows 10 Famille version 18363
* architecture processeur : 64-bit
* mémoire physique totale : 16 151 Mo

Pour le modèle de la RAM il faut uiliser une autre commande , ``wmic MemoryChip list full`` et on obtient :
```
Model=
```

## Devices
Pour le processeur c'est la commande ``Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, Number*`` qui donne le nom et le nombres de coeurs de celui ci.
```
Name                                      NumberOfCores NumberOfEnabledCore NumberOfLogicalProcessors
----                                      ------------- ------------------- -------------------------
Intel(R) Core(TM) i7-1065G7 CPU @ 1.30GHz             4                   4                         8
```
