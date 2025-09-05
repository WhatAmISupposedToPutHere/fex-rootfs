subarch: amd64
target: stage4
version_stamp: desktop-systemd
rel_type: 23.0-default
profile: default/linux/amd64/23.0/desktop/systemd
snapshot_treeish: @TREEISH@.xz
source_subpath: 23.0-default/stage4-amd64-clang
compression_mode: tar
portage_confdir: /var/tmp/catalyst/config/stages
portage_prefix: stage4f
binrepo_path: amd64/binpackages/23.0/x86-64
stage4/packages: --with-bdeps=y --deep sys-fs/fuse:0 sys-fs/fuse:3 x11-libs/gtk+:2 x11-libs/gtk+:3
	dev-libs/nspr
	dev-libs/nss
	dev-libs/opencl-icd-loader
	dev-libs/protobuf
	dev-libs/protobuf-c
	dev-python/pyyaml
	dev-util/vulkan-tools
	media-libs/glew
	media-libs/glu
	media-libs/harfbuzz
	media-libs/libpulse
	media-libs/libsdl
	media-libs/libsdl2
	media-libs/mesa
	media-libs/openal
	media-libs/sdl2-gfx
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-net
	media-libs/sdl2-ttf
	media-libs/speex
	sys-apps/pciutils
	sys-auth/libnss-nis
	x11-apps/mesa-progs
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-xrm
	x11-terms/xterm
	@world
