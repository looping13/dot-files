## How to fix grub from [Arch Wiki](https://wiki.archlinux.org/title/Chroot)


### boot the Archlinux usb
1. loadkeys fr-latin1 to load french keyboard
1. lsblk to check device

### Mount devices
1. mount /dev/sda2 /mnt
1. mount /dev/sda1 /mnt/boot/efi

### Change root with special Arch script
arch-chroot /mnt
### Repair grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
### run grub config
grub-mkconfig -o /boot/grub/grub.cfg

*hint* Navigate in bash history to avoid typing the commands
