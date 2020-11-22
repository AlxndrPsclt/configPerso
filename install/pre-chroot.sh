#!/usr/bin/env sh

wget https://raw.githubusercontent.com/AlxndrPsclt/configPerso/master/install/sda.dump
cat sda.dump | sudo sfdisk /dev/sda


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

#then:
pacstrap /mnt base base-devel linux linux-firmware sudo vim python openssh git grub intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
#arch-chroot /mnt



