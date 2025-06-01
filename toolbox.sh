#!/bin/bash
#
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Alejandro Visiedo <alejandro.visiedo@gmail.com>
#
# Prepare c++ profile

# Install openh264
install_h264() {
  source "/etc/os-release"
  local openh264_version="2.4.1-2"
  local openh264_rpm="openh264-${openh264_version}.fc${VERSION_ID}.$(rpm --query --queryformat '%{ARCH}\n' rpm).rpm"
  toolbox enter "${TOOLBOX}" << EOF
curl -k -O "https://ciscobinary.openh264.org/${openh264_rpm}"
sudo dnf --disablerepo='*' install -y "${openh264_rpm}"
rm -f "${openh264_rpm}"
EOF
}

install_h264  # Must be called before source to avoid the repository dependencies on this package
pkgs+=(make clang++ libtool cmake clang-tools-extra qt-creator qt-config qt-doc kdevelop omniORB-devel omniORB-utils openssh-askpass clang)
source "${TOOLBOX_PROFILE_PATH}/toolbox.common.sh"

toolbox_helper_install_vscode

# Sometimes python tools are used in the repository
if [ -e "requirements.txt" ] || [ -e "requirements-dev.txt" ]; then
	source "${TOOLBOX_PROFILE_PATH}/toolbox.python.sh"
fi

if [ -e "tools/go.mod" ]; then
	printf "error: todo: add local tool installation process\n" >&3
	exit 1
	# shellcheck disable=SC2317
	toolbox enter "${TOOLBOX}" <<EOF
EOF
fi
