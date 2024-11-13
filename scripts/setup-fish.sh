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

echo -e "${C_AQUA}Installing fish using ${PACKAGE_MANAGER}...${F_RESET}"
./scripts/libs/install-pkgs.sh "$PACKAGE_MANAGER" fish
echo -e "${C_LIME}Installation completed successfully!${F_RESET}"

echo -e "${C_AQUA}Installing starship using ${PACKAGE_MANAGER}...${F_RESET}"
./scripts/libs/install-pkgs.sh "$PACKAGE_MANAGER" starship
echo -e "${C_LIME}Installation completed successfully!${F_RESET}"

echo -e "${C_AQUA}Applying fish configurations...${F_RESET}"
for file in ./configs/fish/*.fish; do
  cp $file $HOME/.config/fish
done
echo -e "${C_LIME}Configuration applyed successfully!${F_RESET}"

echo -e "${C_AQUA}Changing the default shell to fish...${F_RESET}"
chsh -s /usr/bin/fish
echo -e "${C_LIME}Change completed successfully!${F_RESET}"

echo -e "${C_LIME}All done, good bye!${F_RESET}"
