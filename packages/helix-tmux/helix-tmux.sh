status_line=$(tmux capture-pane -p | rg -e "(?:NORMAL|INSERT|SELECT)\s+[\x{2800}-\x{28FF}]*\s+(\S*)\s[^│]* (\d+):*.*" -o --replace '$1 $2')
filename=$(echo "$status_line" | awk '{ print $1}')
folder=$(dirname "$filename")
line_number=$(echo "$status_line" | awk '{ print $2}')

function tmux_popup() {
  tmux popup -d "#{pane_current_path}" -xC -yC -w100% -h100% -E "$1"
}

function popup_lazygit() {
  tmux_popup lazygit
}

function popup_lf() {
  local TEMP
  TEMP=$(mktemp)
  if test -z "$folder"; then
    tmux_popup "lf -selection-path=$TEMP"
  else
    tmux_popup "lf -selection-path=$TEMP -command ':cd $folder'"
  fi
  echo >>"$TEMP"
  while read -r line; do
    tmux send-keys ":open $line" C-m
  done <"$TEMP"
}

function popup_broot() {
  local TEMP="/tmp/broot_selection_path"
  local broot_cmd="broot --conf $HOME/.config/broot/select.hjson"

  if git rev-parse >/dev/null 2>/dev/null; then
    local git_root
    git_root=$(git rev-parse --show-toplevel)
    tmux popup -d "$git_root" -xC -yC -w100% -h100% -E "$broot_cmd"
  else
    tmux_popup "$broot_cmd"
  fi

  if test -e "$TEMP"; then
    while read -r line; do
      tmux send-keys ":open $line" C-m
    done <"$TEMP"
    rm $TEMP
  fi
}

function popup_search() {
  tmux send-keys "_*\ *" C-m
}

function popup_livegrep() {
  # live-grep: interactive search, output is "file:line" pairs
  FILE_PATHS=$(live-grep --exit-on-execution | tr '\n' ' ' | sed 's/ *$//')

  if [[ -n $FILE_PATHS ]]; then
    tmux send-keys ":o $FILE_PATHS" C-m
  fi
}

function popup_make() {
  tmux_popup "make|ov"
}

function popup_blame() {
  if test -n "$filename" && test -n "$line_number"; then
    tmux_popup "tig blame $filename +$line_number"
  else
    echo "error"
  fi
}

case "$1" in
"lazygit")
  popup_lazygit
  ;;
"lf")
  popup_lf
  ;;
"broot")
  popup_broot
  ;;
"search")
  popup_search
  ;;
"livegrep")
  popup_livegrep
  ;;
"make")
  popup_make
  ;;
"blame")
  popup_blame
  ;;
esac
