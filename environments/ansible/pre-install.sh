#Create partitions, and mount them on /mnt, 

timectl set-ntp true
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/var
mount /dev/sda5 /mnt/home
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
#then:
pacstrap /mnt base base-devel linux linux-firmware vim python NetworkManager openssh git
genfstab -U /mnt > /mnt/etc/fstab.conf
arch-chroot /mnt
