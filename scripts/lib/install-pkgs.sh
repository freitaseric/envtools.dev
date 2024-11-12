#! /usr/bin/bash

PACKAGE_MANAGER="$1"
shift

PACKAGES="$@"

case "$PACKAGE_MANAGER" in
  "apt")
    sudo apt update
    sudo apt install -y $packages
    exit 0
    ;;
  "dnf")
    sudo dnf install -y $packages
    exit 0
    ;;
  "pacman")
    sudo pacman -Sy --noconfirm $packages
    exit 0
    ;; 
  "zypper")
    sudo zypper install -y $packages
    exit 0
    ;;
  "apk")
    sudo apk add $packages
    exit 0
    ;;
esac