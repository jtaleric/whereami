# whereami
Where Am I is a script to listen on a interface for CDP messages, to determine what port a machine is plugged into a Cisco switch.

[root@]# ./whereami.sh
Error : Pass interface to listen on.
Usage : ./whereami.sh eth0

[root@]# ./whereami.sh p1p1
Error : Is CDP enabled?

[root@]# ./whereami.sh p1p1
Connected to : n7010-l1h1-vdc2.mgmt.lab.eng.bos.redhat.com
On interface : 'Ethernet3/37'

