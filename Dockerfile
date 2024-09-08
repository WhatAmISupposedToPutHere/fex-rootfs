ARG DATE=20240913
FROM docker.io/gentoo/stage3:${DATE}
RUN emerge-webrsync --revert=${DATE} && \
    export USE="-iso python" && \
    export MAKEOPTS="-j$(nproc)" && \
    echo 'dev-util/catalyst ~arm64 arm64' >/etc/portage/package.accept_keywords/catalyst && \
    emerge -j util-linux && \
    emerge -j catalyst && \
    USE=zstd emerge -j squashfs-tools && \
    echo 'jobs = 40' >>/etc/catalyst/catalyst.conf && \
    echo 'export MAKEOPTS="-j$(nproc)"' >>/etc/catalyst/catalystrc && \
    rm -rf /var/db/repos/gentoo
