# Custom Script for Linux
# provision new drive
# attach to /var
apt-get -y update
parted -s -a optimal /dev/sdc mklabel msdos
parted -s -a optimal /dev/sdc mkpart primary ext4 0% 100%
#parted mounts the drive at /mnt by default
