F_RESET="\033[0m"
C_TEAL="\033[38;5;6m"

while IFS= read -r line; do
  echo -e "${C_TEAL}${line}${F_RESET}"
done < "banner.txt"

echo
echo