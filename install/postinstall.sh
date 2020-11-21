#systemctl enable dhcpcd
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable sshd.service

#grub-install --target=i386-pc /dev/sda
#grub-install --target=86_64-efi --efi-directory /boot/EFI/ --bootloader-id=GRUB /dev/sda

#grub-mkconfig -o /boot/grub/grub.cfg



sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "seawatch3" > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	seawatch3.localdomain	seawatch3" > /etc/hosts

#mkinitcpio -P

useradd -m -s /bin/bash -g wheel -p alex alex
echo -e "alex\nalex" | passwrd alex

sed -i 's/^# %wheel ALL=(ALL)/%wheel ALL=(ALL)/' /etc/sudoers

# TODO: Install rflector and execte  https://itsfoss.com/install-arch-linux/

#bootctl --path=/boot install

## Add line to enable multilib
