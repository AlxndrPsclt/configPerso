#Create partitions: /boot swap / /var /home

mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkfs.ext4 /dev/sda5
mkswap /dev/sda2
swapon /dev/sda2

timectl set-ntp true
mount /dev/sda3 /mnt
mkdir -p /mnt/boot
mkdir /mnt/home
mkdir /mnt/var
mount /dev/sda4 /mnt/var
mount /dev/sda5 /mnt/home
mount /dev/sda1 /mnt/boot
mkdir /mnt/boot/EFI

#then:
pacstrap /mnt base base-devel linux linux-firmware sudo vim python dhcpcd wifi-menu dialog networkmanager openssh git grub efibootmgr os-prober
arch-chroot /mnt
systemctl enable dhcpcd
systemctl enable NetworkManager

#grub-install --target=i386-pc /dev/sda
grub-install --target=86_64-efi --efi-directory /boot/EFI/ --bootloader-id=GRUB /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg



sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "LANG=en-US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "hostname" > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	hostname.localdomain	hostname" > /etc/hosts

mkinitcpio -P

useradd -m alex -s /bin/bash -g wheel,audio,video,optical,storage -p password

sed -i '^# %wheel ALL=(ALL)/%wheel ALL=(ALL)/' /etc/sudoers

## Add line to enable multilib
