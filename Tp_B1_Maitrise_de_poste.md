# I.Self-footprinting 
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