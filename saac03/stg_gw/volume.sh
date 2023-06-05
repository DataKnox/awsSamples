ls /etc/iscsi/

cat /etc/iscsi/initiatorname.iscsi 

sudo iscsiadm -m discovery -t sendtargets -p 10.10.10.179

sudo iscsiadm -m node -o show

ls /dev

sudo iscsiadm -m node --login 

lsblk

ls /dev

sudo fdisk /dev/sdb

lsblk

sudo mkfs.ext4 /dev/sdb1 

sudo mkdir /test

sudo mount /dev/sdb1 /test