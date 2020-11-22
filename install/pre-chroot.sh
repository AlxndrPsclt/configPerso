#!/usr/bin/env sh

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
genfstab -U /mnt >> /mnt/etc/fstab

wget -O /mnt/tmp/post-chroot.sh https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/install/post-chroot.sh
arch-chroot /mnt /tmp/post-chroot.sh



