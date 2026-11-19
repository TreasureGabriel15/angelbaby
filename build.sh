#!/bin/sh
gcc -static -o userspace/init userspace/init.c || exit 1
cp userspace/init build/rootfs/init
(cd build/rootfs && find . | cpio -o -H newc -R 0:0 2>/dev/null | gzip > ../initramfs.cpio.gz)
qemu-system-x86_64 -kernel build/bzImage -initrd build/initramfs.cpio.gz -append "console=ttyS0" -nographic -m 512M
