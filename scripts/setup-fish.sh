#! /usr/bin/bash

F_RESET="\033[0m"
C_AQUA="\033[38;5;14m"
C_LIME="\033[38;5;10m"

./scripts/lib/show-banner.sh

if [ -d "/tmp/mydots" ]; then
  rm -rf /tmp/mydots
fi

mkdir /tmp/mydots

./scripts/lib/getos.sh

PACKAGE_MANAGER=$(cat /tmp/mydots/getos)

echo -e "${C_AQUA}Installing fish using ${PACKAGE_MANAGER}...${F_RESET}"
./scripts/lib/install-pkgs.sh
echo -e "${C_LIME}Installation completed successfully!${F_RESET}"