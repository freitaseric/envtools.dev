#! /usr/bin/bash

# Formats
F_RESET="\033[0m"

# Colors
C_AQUA="\033[38;5;14m"
C_LIME="\033[38;5;10m"
C_YELLOW="\033[38;5;226m"

echo -e "${C_AQUA}Detecting the user os and package manager...${F_RESET}"

if command -v "apk" >/dev/null; then
  echo -e "${C_LIME}Detected! The user system is ${C_YELLOW}Alpine Linux ${C_LIME}and your package manager is ${C_YELLOW}apk${C_AQUA}.${F_RESET}"

  echo "apk" > /tmp/mydots/getos
  exit 0
fi

if command -v "apt" >/dev/null; then
  echo -e "${C_LIME}Detected! The user system is ${C_YELLOW}Debian-based ${C_LIME}and your package manager is ${C_YELLOW}apt${C_AQUA}.${F_RESET}"
  
  echo "apt" > /tmp/mydots/getos
  exit 0
fi

if command -v "dnf" >/dev/null; then
  echo -e "${C_LIME}Detected! The user system is ${C_YELLOW}REHL-based ${C_LIME}and your package manager is ${C_YELLOW}dnf${C_AQUA}.${F_RESET}"
  
  echo "dnf" > /tmp/mydots/getos
  exit 0
fi

if command -v "pacman" >/dev/null; then
  echo -e "${C_LIME}Detected! The user system is ${C_YELLOW}Arch-based ${C_LIME}and your package manager is ${C_YELLOW}pacman${C_AQUA}.${F_RESET}"
  
  echo "pacman" > /tmp/mydots/getos
  exit 0
fi

if command -v "zypper" >/dev/null; then
  echo -e "${C_LIME}Detected! The user system is ${C_YELLOW}SUSE-based ${C_LIME}and your package manager is ${C_YELLOW}zypper${C_AQUA}.${F_RESET}"
  
  echo "zypper" > /tmp/mydots/getos
  exit 0
fi

./scripts/libs/throw.sh "InternalError" "This dotfiles does not yet support your system." "Contact the dev or make a pull request for add support for this system." 