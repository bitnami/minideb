#!/bin/bash

set -eu

do_sudo() {
  if [[ "0" == "$(id --user)" ]]; then
    "$@"
  else
    sudo "$@"
  fi
}

while do_sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
    sleep 1
done

do_sudo apt-get update
do_sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients qemu-utils genisoimage virtinst curl rsync qemu-system-x86 qemu-system-arm cloud-image-utils

