#! /usr/bin/bash

PACKAGE_MANAGER="$1"
shift

PACKAGES="$@"

case "$PACKAGE_MANAGER" in
  "apt")
    sudo apt update >/dev/null
    sudo apt install -y $PACKAGES >/dev/null
    ;;
  "dnf")
    sudo dnf install -y $PACKAGES >/dev/null
    ;;
  "pacman")
    sudo pacman -Sy --noconfirm $PACKAGES >/dev/null
    ;; 
  "zypper")
    sudo zypper install -y $PACKAGES >/dev/null
    ;;
  "apk")
    sudo apk add $PACKAGES >/dev/null
    ;;
esac

if [ $? -ne 0 ]; then
  ./scripts/libs/throw.sh "NotFoundError" "No package(s) found in your distro's repository, nothing to do." "You will install these packages manually: ${PACKAGES}"
fi
