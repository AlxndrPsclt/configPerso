#!/usr/bin/env sh

echo "Welcome to Fundmntl"
lsblk
echo -n "This script will COMPLETELY ERASE your disk sda. Are you sure you want to do this (y/n)? "
read answer


if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Ok, let's go"
else
    echo "Ok, not doing anything. See you later maybe."
    exit 0
fi


wget https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/install/sda.dump



cat sda.dump | sfdisk -f /dev/sda


#Create partitions: / /home crypted and swap

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkswap /dev/sda4
swapon /dev/sda4

timectl set-ntp true
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda2 /mnt/home

pacstrap /mnt base base-devel linux linux-firmware sudo vim python openssh git grub intel-ucode reflector
genfstab -U /mnt > /mnt/etc/fstab

wget -O /mnt/etc/systemd/network/10-wired.network https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/network/10-wired.network
wget -O /mnt/etc/systemd/network/25-wireless.network https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/network/25-wireless.network

wget -O /mnt/root/post-chroot.sh https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/install/post-chroot.sh
chmod u+x /mnt/root/post-chroot.sh
arch-chroot /mnt /root/post-chroot.sh
