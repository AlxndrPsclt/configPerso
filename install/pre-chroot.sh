#!/usr/bin/env sh

#Create partitions: /boot swap / /var /home

mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkswap /dev/sda2
swapon /dev/sda2

timectl set-ntp true
mount /dev/sda3 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mkdir /mnt/var
mount /dev/sda4 /mnt/home
mount /dev/sda1 /mnt/boot

#then:
pacstrap /mnt base base-devel linux linux-firmware sudo vim python openssh git grub intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
#arch-chroot /mnt



