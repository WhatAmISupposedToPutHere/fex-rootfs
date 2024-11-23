#!/bin/bash
source envs.sh
set -euo pipefail
cp -a ./*  /var/tmp/catalyst/
cd /var/tmp/catalyst/
mkdir -p builds/23.0-default
if [[ "x${DOWNLOAD_SEED-}" != x ]]; then
    name="stage3-amd64-systemd-${TIMESTAMP_L}.tar.xz"
    [ -f "${name}" ] || wget -nv "https://distfiles.gentoo.org/releases/amd64/autobuilds/${TIMESTAMP_L}/${name}"
    cp "${name}" builds/23.0-default/
fi
name="gentoo-${TIMESTAMP_S}.xz.sqfs"
[ -f "${name}" ] || wget -nv "https://distfiles.gentoo.org/snapshots/squashfs/${name}"
mkdir -p snapshots
cp "${name}" snapshots/
sed -i "s/@TIMESTAMP@/${TIMESTAMP_L}/g" *.spec
sed -i "s/@TREEISH@/${TIMESTAMP_S}/g" *.spec
catalyst -af "$1"
