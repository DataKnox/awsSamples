sudo apt install nfs-kernel-server

sudo mkdir -p /mnt/nfs_share

sudo chown -R nobody:nogroup /mnt/nfs_share/

sudo chmod 777 /mnt/nfs_share/

sudo nano /etc/exports
# paste this to whitelist a 10.0.0.0/8 subnet
# /mnt/nfs_share 10.0.0.0/8(rw,sync,no_subtree_check)
# save and close
sudo exportfs -a

sudo systemctl restart nfs-kernel-server