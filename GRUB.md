## How to fix grub from [Arch Wiki](https://wiki.archlinux.org/title/Chroot)

###boot the Archlinux usb
lsblk to check device
###Mount devices
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
### Change root with special Arch script
arch-chroot /mnt
### Repair grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
### run grub config
grub-mkconfig -o /boot/grub/grub.cfg
