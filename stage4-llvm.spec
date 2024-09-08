subarch: amd64
target: stage4
version_stamp: clang
rel_type: 23.0-default
profile: default/linux/amd64/23.0/systemd
snapshot_treeish: @TREEISH@.xz
source_subpath: 23.0-default/stage3-amd64-systemd
compression_mode: pixz
portage_confdir: /var/tmp/catalyst/config/stages
portage_prefix: stage4
binrepo_path: amd64/binpackages/23.0/x86-64
stage4/packages: --with-bdeps=y sys-devel/clang
