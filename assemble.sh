#!/bin/bash
set -euo pipefail
mkdir -p rootfs chroot/{etc,dev,proc,sys,usr/{bin,lib,share}}
cd rootfs
tar xf ../stage4-amd64-desktop-systemd.tar
rm -r sys dev proc
find etc/ -mindepth 1 -maxdepth 1 \
     \! -name eselect -a \
     \! -name 'ld.so*' \
     -exec mv {} ../chroot/etc/ \;
mv boot home media mnt opt root run tmp var ../chroot/
mv usr/{include,libexec,local,sbin,src,x86_64-pc-linux-gnu} ../chroot/usr/
mkdir -p ../chroot/usr/lib/locale
mv usr/lib/locale/locale-archive ../chroot/usr/lib/locale/
find usr/bin -mindepth 1 -maxdepth 1 \
     \! -name 'mango*' -a \
     \! -name '*vulkan*' -a \
     \! -name '*vk*' -a \
     \! -name ulimit -a \
     \! -name ldd -a \
     \! -name env -a \
     \! -name sh -a \
     \! -name bash -a \
     \! -name ls -a \
     \! -name stat -a \
     \! -name dirname -a \
     \! -name realpath -a \
     \! -name basename -a \
     \! -name nproc -a \
     \! -name uname -a \
     \! -name ldconfig -a \
     \! -name arch -a \
     -exec mv {} ../chroot/usr/bin/ \;
find usr/share -mindepth 1 -maxdepth 1 \
     \! -name drirc.d -a \
     \! -name vulkan \
     -exec mv {} ../chroot/usr/share/ \;
cd ..
mksquashfs rootfs fex-rootfs.sqfs -comp zstd
mksquashfs chroot fex-chroot.sqfs -comp zstd
