#!/bin/bash
set -euo pipefail
emerge-webrsync --revert=$1
USE=-perl emerge -1j eselect-repository dev-vcs/git bindgen
eselect repository enable asahi
emaint sync -r asahi
