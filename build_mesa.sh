#!/bin/bash
set -euo pipefail
release=20241012
wget "https://github.com/WhatAmISupposedToPutHere/fex-rootfs/releases/download/${release}/fex-rootfs.sqfs"
wget "https://github.com/WhatAmISupposedToPutHere/fex-rootfs/releases/download/${release}/fex-chroot.sqfs"
mkdir rootfs chroot layer1 layer2 work result
mount fex-chroot.sqfs chroot
mount fex-rootfs.sqfs rootfs
mount -t overlay overlay -olowerdir=chroot:rootfs,upperdir=layer1,workdir=work result
for dir in package.accept_keywords package.mask package.use profile/package.use.force; do
    cp config/stages/$dir/stage4/* result/etc/portage/$dir/
done
cp build_mesa_chr.sh result/
cd result
echo 'VIDEO_CARDS="asahi honeykrisp"' >>etc/portage/make.conf
echo 'media-libs/mesa arm64 ~arm64' >etc/portage/package.accept_keywords/mesa
echo 'sys-kernel/asahi-sources-6.11.4_p1' >etc/portage/profile/package.provided/kernel
for dir in dev sys proc; do
    mount --rbind /$dir $dir
    mount --make-rslave $dir
done
chroot . /bin/bash /build_mesa_chr.sh 20241012
cd ../
umount -R result
mount -t overlay overlay -olowerdir=layer1:chroot:rootfs,upperdir=layer2,workdir=work result
cd result
for dir in dev sys proc; do
    mount --rbind /$dir $dir
    mount --make-rslave $dir
done
chroot . emerge -1j mesa::asahi
cd ..
umount -R result
rm -rf layer2/tmp layer2/var layer2/etc/{environment.d,csh.env,ld.so.cache,profile.env}
mksquashfs layer2 fex-mesa.sqfs -comp zstd
