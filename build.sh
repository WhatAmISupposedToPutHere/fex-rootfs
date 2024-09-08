#!/bin/bash
source envs.sh
set -euo pipefail
cd /var/tmp/catalyst/
git init
git remote add origin https://github.com/WhatAmISupposedToPutHere/fex-rootfs
git fetch -a origin
git checkout "${GIT_SHA}"
mkdir -p builds/23.0-default
if [[ "x${DOWNLOAD_SEED-}" != x ]]; then
    name="stage3-amd64-systemd-${TIMESTAMP_L}.tar.xz"
    [ -f "${name}" ] || wget "https://distfiles.gentoo.org/releases/amd64/autobuilds/${TIMESTAMP_L}/${name}"
    cp "${name}" builds/23.0-default/
fi
name="gentoo-${TIMESTAMP_S}.xz.sqfs"
[ -f "${name}" ] || wget "https://distfiles.gentoo.org/snapshots/squashfs/${name}"
mkdir -p snapshots
cp "${name}" snapshots/
sed -i "s/@TIMESTAMP@/${TIMESTAMP_L}/g" *.spec
sed -i "s/@TREEISH@/${TIMESTAMP_S}/g" *.spec
catalyst -af "$1"
