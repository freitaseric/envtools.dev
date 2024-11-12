#! /usr/bin/bash

# Formats
F_RESET="\033[0m"
F_BOLD="\033[1m"

# Colors
C_RED="\033[38;5;9m"
C_YELLOW="\033[38;5;11m"

# Arguments
E_NAME=$1
E_MESSAGE=$2
E_SOLUTION=$3

if [[ -z "${E_NAME}" ]]; then
  E_NAME="Error"
fi

if [[ -z "${E_MESSAGE}" ]]; then
  E_MESSAGE="An error has been ocurred!"
fi

if [[ -z "${E_SOLUTION}" ]]; then
  E_SOLUTION="You can try run again this script."
fi

echo -e "${C_RED}${F_BOLD}${E_NAME}: ${F_RESET}${C_RED}${E_MESSAGE}${F_RESET}" >&2
echo -e "${C_YELLOW}${E_SOLUTION}${F_RESET}" >&2
exit 1