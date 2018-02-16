# Custom Script for Linux
# provision new drive
# attach to /var
id > /tmp/whoami.out
apt-get -y update
parted -s -a optimal /dev/sdc mkpart primary
#parted mounts the drive at /mnt by default
umount /dev/sdc1
mkfs -t ext4 /dev/sdc1
mount /dev/sdc1 /mnt
cd /var
rsync -aqxP /var/* /mnt
cd /
umount /mnt
mv var var.old
mkdir var
mount /dev/sdc1 /var
cat > /etc/fstab <<EOF
/dev/sdc1       /var     ext4    defaults    0 0
EOF
apt-get -y install apache2
