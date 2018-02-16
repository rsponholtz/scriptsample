# Custom Script for Linux
# provision new drive
# attach to /var
apt-get -y update
parted -s -a optimal /dev/sdc mklabel msdos
parted -s -a optimal /dev/sdc mkpart primary ext4 0% 100%
#parted mounts the drive at /mnt by default
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

