# provision new drive
# attach to /var
apt-get -y update
parted -s -a optimal /dev/sdc mklabel msdos
parted -s -a optimal /dev/sdc mkpart primary ext4 0% 100%
#parted mounts the drive at /mnt by default
umount /mnt
mkfs -t ext4 /dev/sdc1
mount /dev/sdc1 /mnt
cd /var
rsync -aulvXpogtr /var/* /mnt
cd /
mv /var /var.old
mkdir /var
mount /dev/sdc1 /var
cat > /etc/fstab <<EOF
/dev/sdc1       /var     ext4    defaults    0 0
EOF
apt-get -y install apache2
