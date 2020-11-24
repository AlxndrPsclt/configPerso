# Contxtl-install Arch version

A repository containing scripts to automatically setup your contxtl desktop. Get from new laptop to you session in no time.

## Initial script

First, boot the last arch linux thumbdrive. Then just dl the script and go.
This script will partition /dev/sda (!!! Carefull with your data, this will erase everything) and install all the basics needed for the computer to boot. It sets up basic ethernet network and configures ssh. It changes the root password and adds a second user that is in the wheel group. Sets sudo without password.

Works only with BIOS; but UEFI support should be easy to add and will eventually be supported.

Check the pre-chroot.sh and post-chroot.sh for more details.

```
wget -O ~/contxtl-install.sh https://cutt.ly/contxtl-install
chmod u+x ~/contxtl-install.sh
./contxtl-install.sh
```

## Ansible setup scripts

Once the basic setup is complete, reboot the machine; connect and test if everything is working. Next, you will need a different machine to launch the ansible collection of setup scripts for a personal computer: laptop and desktop are curently in scope. Support for local setup will be though about.

They are meant to be run on a clean arch-linux install; and is the only plateform this was tested on.

First, you have to get the pre-install.sh script and run it on the destination machine. You the should edit the config files to match you desired system.

Then, you can run the ansible playbook from the control machine, using the launch-setup.sh script. The destination machine can be the same the control machine; you just need to install ansible on the machine (will soon be added to generic install script).



## Config files

Change the hostname in post-chroot.sh script if necessary.
