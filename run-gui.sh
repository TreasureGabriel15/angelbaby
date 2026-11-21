#!/bin/sh
qemu-system-x86_64 -M pc -m 512 \
  -kernel buildroot/output/images/bzImage \
  -drive file=buildroot/output/images/rootfs.ext2,if=virtio,format=raw \
  -append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
  -net nic,model=virtio -net user \
  -vga std -display none -vnc :0 \
  -usb -device usb-tablet \
  -serial mon:stdio
