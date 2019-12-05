#Create partitions, and mount them on /mnt, 

timectl set-ntp true
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/var
mount /dev/sda5 /mnt/home
mount /dev/sda1 /mnt/boot
mkswap /dev/sda2
swapon /dev/sda2

#then:
pacstrap /mnt base base-devel linux linux-firmware vim python networkmanager openssh git #grub if installing without uefi
genfstab -U /mnt > /mnt/etc/fstab.conf
arch-chroot /mnt
systemctl enable NetworkManager
#pacman -SUY grub
#grub-install --target=i386-pc /dev/sda
#grub-mkconfig -o /boot/grub/grub.cfg

sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "LANG=en-US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

echo "hostname" > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	hostname.localdomain	hostname" > /etc/hosts

useradd -m alex -g wheel -p password
sermod --append --groups <group1,group2,…> alex

sed -i '^# %wheel ALL=(ALL)/%wheel ALL=(ALL)/' /etc/sudoers

## Add line to enable multilib
## Add line to set locales
## Add line to set hwclock
