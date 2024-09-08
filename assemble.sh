#!/bin/bash
set -euo pipefail
mkdir -p rootfs chroot/{etc,dev,proc,sys} chroot/var/{cache,lib,lib/dbus}/
cd rootfs
tar xf ../stage4-amd64-desktop-systemd.tar.xz
rm -r sys dev proc
mv etc/{hosts,resolv.conf,localtime,passwd,group,{,g}shadow,fstab,sub{u,g}id} ../chroot/etc
mv boot home media mnt root tmp run ../chroot/
mv var/{tmp,run,lock} ../chroot/var/
mv var/lib/dbus/machine-id ../chroot/var/lib/dbus/
cd ..
mksquashfs rootfs fex-rootfs.sqfs -comp zstd
mksquashfs chroot fex-chroot.sqfs -comp zstd
