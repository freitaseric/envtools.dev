#! /usr/bin/bash

F_RESET="\033[0m"
C_AQUA="\033[38;5;14m"
C_LIME="\033[38;5;10m"

error_handler() {
  exit 1
}

trap 'error_handler' ERR

./scripts/libs/show-banner.sh

if [ -d "/tmp/mydots" ]; then
  rm -rf /tmp/mydots
fi

mkdir /tmp/mydots

./scripts/libs/getos.sh

PACKAGE_MANAGER=$(cat /tmp/mydots/getos)

echo -e "${C_AQUA}Installing Visual Studio Code using ${PACKAGE_MANAGER}...${F_RESET}"
./scripts/libs/install-pkgs.sh "$PACKAGE_MANAGER" code
echo -e "${C_LIME}Installation completed successfully!${F_RESET}"

echo -e "${C_AQUA}Applying user settings..."
rm -f $HOME/.config/Code/User/settings.json
cp ./configs/code/settings.json $HOME/.config/Code/User/settings.json
echo -e "${C_LIME}Configuration applyed successfully!${F_RESET}"

echo -e "${C_LIME}All done, good bye!${F_RESET}"