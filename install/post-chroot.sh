#!/usr/bin/env sh
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "avrocar3" > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	avrocar3.localdomain	avrocar3" > /etc/hosts

pacman -Sy --noconfirm reflector

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable sshd.service

grub-install --target=i386-pc /dev/sda
#grub-install --target=86_64-efi --efi-directory /boot/EFI/ --bootloader-id=GRUB /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

reflector --verbose --latest 12 --sort rate --save /etc/pacman.d/mirrorlist

#mkinitcpio -P

echo -e "root\nroot" | passwd
useradd -m -s /bin/bash -g wheel -p alex alex
echo -e "alex\nalex" | passwd alex

sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

#bootctl --path=/boot install
