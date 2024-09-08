subarch: amd64
target: stage1
version_stamp: systemd
rel_type: 23.0-default
profile: default/linux/amd64/23.0/systemd
snapshot_treeish: @TREEISH@.xz
source_subpath: 23.0-default/stage3-amd64-systemd-@TIMESTAMP@
compression_mode: pixz
update_seed: no
update_seed_command: --update --deep --newuse @world
portage_confdir: /var/tmp/catalyst/config/stages
portage_prefix: stage13
