file='/etc/os-release'
if [ -f "$file" ]; then
  osVersion=$(cat $file | grep VERSION_ID | cut -d\" -f 2)
  nix-search -c "$osVersion" "$@"
else
  echo "Error: $file not found!"
  exit
fi
