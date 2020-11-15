# I.Self-footprinting 
Toutes les commandes utilisées ici sont sur Windows
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
Pour les disques on utilise la commande ``diskpart`` puis on effectue la demarche suivante sur chaque disque que l'on veut étudier :
   - On fait la commande ``sel disk a`` (où ``a`` est le numéro du disque choisit)
   - On fait ensuite la commande ``detail disk`` pour avoir les info voulues sur le disque

```
DISKPART> select disk 0

Le disque 0 est maintenant le disque sélectionné.

DISKPART> detail disk

IM2P33F3 NVMe ADATA 512GB
ID du disque : {189069E5-C58A-45E9-96D9-B22B78C688AA}
Type : RAID
État : En ligne
Chemin : 3
Cible : 0
ID LUN : 0
Chemin d’accès de l’emplacement : PCIROOT(0)#PCI(1700)#RAID(P03T00L00)
État en lecture seule actuel : Non
Lecture seule : Non
Disque de démarrage : Oui
Disque de fichiers d’échange : Oui
Disque de fichiers de mise en veille prolongée : Non
Disque de fichiers de vidage sur incident : Oui
Disque en cluster  : Non

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     C   OS           NTFS   Partition    457 G   Sain       Démarrag
  Volume 1         ESP          FAT32  Partition    250 M   Sain       Système
  Volume 2         WINRETOOLS   NTFS   Partition    990 M   Sain       Masqué
  Volume 3         Image        NTFS   Partition     16 G   Sain       Masqué
  Volume 4         DELLSUPPORT  NTFS   Partition   1813 M   Sain       Masqué
  ```

## Users
Pour la liste des utilisateurs la commande ``net users`` fonctionne très bien
```
comptes d’utilisateurs de \\DESKTOP-LCCJJQ8

-------------------------------------------------------------------------------
Administrateur           DefaultAccount           Invité
raphael                  WDAGUtilityAccount
```

## Processus
Les processus s'obtiennent grâce a la commande ``tasklist``
```
Nom de l’image                 PID Nom de la sessio Numéro de s Utilisation
========================= ======== ================ =========== ============
System Idle Process              0 Services                   0         8 Ko
System                           4 Services                   0     1 836 Ko
Registry                       120 Services                   0    46 148 Ko
smss.exe                       648 Services                   0       524 Ko
csrss.exe                      752 Services                   0     3 000 Ko
wininit.exe                    840 Services                   0     2 596 Ko
services.exe                   988 Services                   0     6 668 Ko
lsass.exe                     1004 Services                   0    14 040 Ko
fontdrvhost.exe               1040 Services                   0       688 Ko
WUDFHost.exe                  1164 Services                   0     2 920 Ko
igfxCUIServiceN.exe           1904 Services                   0     4 840 Ko
wsc_proxy.exe                 2112 Services                   0     7 552 Ko
svchost.exe                   2296 Services                   0     6 388 Ko
Memory Compression            2304 Services                   0   602 988 Ko
AvastSvc.exe                  3420 Services                   0   191 352 Ko
aswToolsSvc.exe               3620 Services                   0    47 048 Ko
OneApp.IGCC.WinService.ex     3552 Services                   0    20 960 Ko
SessionService.exe            4232 Services                   0       800 Ko
esif_uf.exe                   4248 Services                   0     1 080 Ko
IntelCpHDCPSvc.exe            4484 Services                   0     1 540 Ko
QcomWlanSrvx64.exe            4512 Services                   0     1 524 Ko
RtkAudUService64.exe          4520 Services                   0     4 352 Ko
AdminService.exe              4528 Services                   0     2 484 Ko
SmartByteNetworkService.e     4536 Services                   0    32 572 Ko
WavesSysSvc64.exe             4604 Services                   0     9 700 Ko
RstMwService.exe              4620 Services                   0     1 176 Ko
LMS.exe                       4652 Services                   0     4 812 Ko
OfficeClickToRun.exe          4672 Services                   0    23 664 Ko
MBAMService.exe               5116 Services                   0    33 356 Ko
jhi_service.exe               5340 Services                   0       936 Ko
RAPSService.exe               5712 Services                   0     6 184 Ko
RAPS.exe                      6652 Services                   0     7 636 Ko
conhost.exe                   6660 Services                   0     1 656 Ko
WmiPrvSE.exe                  7224 Services                   0    38 448 Ko
...
```
Quelques processus sytemes expliqués :
   - ``csrss.exe`` : composant de la famille de systèmes              d'exploitation Windows NT qui fournit le côté utilisateur du sous - système Win32 en mode utilisateur
   - ``services.exe`` : fichier qui lance l'utilitaire Service Control Manager
   - ``smss.exe`` : execute les processus winlogon.exe et csrss.exe 
   - ``conhost.exe`` : fait le tampon entre une application, son affichage et les paries plus 'basses' de windows

## Network

# II. Scripting
## 1er Script
Voir [Script 1](https://github.com/megalya/TP/blob/master/script_1.ps1)

## 2nd Script 
Voir [Script 2](https://github.com/megalya/TP/blob/master/tp1_script2.ps1)
# III.Gestion de softs

# IV.Machine virtuelle
## Configuration post-install
Je me suis connecté a CentOS (``192.168.120.50``)via l'utilisateur "user"
```
PS C:\Users\rapha> ssh user@192.168.120.50
user@192.168.120.50's password:
Last login: Tue Nov 10 13:13:03 2020
Last login: Tue Nov 10 13:13:03 2020
[user@localhost ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:d3:82:d4 brd ff:ff:ff:ff:ff:ff
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:b5:d9:34 brd ff:ff:ff:ff:ff:ff
    inet 192.168.120.50/24 brd 192.168.120.255 scope global noprefixroute dynamic enp0s8
       valid_lft 547sec preferred_lft 547sec
    inet6 fe80::4878:570f:6f52:d207/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[user@localhost ~]$
``` 