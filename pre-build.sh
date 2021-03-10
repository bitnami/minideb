#!/bin/bash

set -e
set -u
set -o pipefail

if [[ ! -f /etc/debian_version ]]; then
  echo "minideb can currently only be built on debian based distros, aborting..."
  exit 1
fi

apt-get update
apt-get install -y debootstrap debian-archive-keyring jq dpkg-dev gnupg apt-transport-https ca-certificates curl gpg

if ! command -v gcloud &> /dev/null
then
    echo "Installing gcloud"
    echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

    apt-get update
    apt-get install -y google-cloud-sdk
else
    echo "gcloud is installed"
fi
