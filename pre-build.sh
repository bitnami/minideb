#!/bin/bash

set -e
set -u
set -o pipefail

apt-get update
apt-get install -y debootstrap debian-archive-keyring jq dpkg-dev
