sessionDir="$HOME/.local/share/aria2"
sessionFile="$HOME/.local/share/aria2/session"
if ! test -d "$sessionDir"; then
  mkdir -p "$sessionDir"
fi
if ! test -e "$sessionFile"; then
  touch "$sessionFile"
fi
