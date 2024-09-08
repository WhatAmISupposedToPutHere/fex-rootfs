subarch: amd64
target: stage4
version_stamp: desktop-systemd
rel_type: 23.0-default
profile: default/linux/amd64/23.0/desktop/systemd
snapshot_treeish: @TREEISH@.xz
source_subpath: 23.0-default/stage4-amd64-clang
compression_mode: pixz
portage_confdir: /var/tmp/catalyst/config/stages
portage_prefix: stage4
binrepo_path: amd64/binpackages/23.0/x86-64
stage4/fsscript: fsscript.sh
stage4/packages: --with-bdeps=y sys-fs/fuse:0 sys-fs/fuse:3
	app-admin/sudo
	app-emulation/wine-vanilla
	dev-libs/nspr
	dev-libs/protobuf
	dev-libs/protobuf-c
	dev-util/clinfo
	dev-util/vulkan-tools
	gnome-extra/zenity
	media-libs/glew
	media-libs/glu
	media-libs/libpulse
	media-libs/libsdl
	media-libs/libsdl2
	media-libs/mesa
	media-libs/openal
	media-libs/speex
	sys-apps/pciutils
	sys-apps/usbutils
	sys-apps/xdg-desktop-portal-gtk
	sys-auth/libnss-nis
	x11-apps/mesa-progs
	x11-libs/xcb-util-xrm
	x11-terms/xterm
	dev-util/bindgen
	dev-python/pyyaml
