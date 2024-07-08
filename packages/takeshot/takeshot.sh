#!/usr/bin/env bash
## Script to take screenshots with maim

time=$(date +%Y-%m-%d_%H:%M:%S)
#geometry=$(xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
dir="$HOME/Pictures/Screenshots"
file="Screenshot_''${time}.webp"

# notify
notify_user() {
  if [[ -e "$dir/$file" ]]; then
    notify-send "Saved as ''${dir}/''${file}"
  else
    notify-send "Screenshot Deleted."
  fi
}

# take shots
shotnow() {
  # cd "''${dir}" && maim -u -f webp "$file" && viewnior "''${dir}"/"$file"
  cd "''${dir}" && maim -u -f webp "$file"
  notify_user
}

shotwin() {
  cd "''${dir}" && maim -u -f webp -i "$(xdotool getactivewindow)" "$file" && xclip -selection clipboard -target image/webp -filter <"''${dir}"/"$file" &>/dev/null # cd "''${dir}" && maim -u -f webp -i "$(xdotool getactivewindow)" | convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage "$file" && xclip -selection clipboard -target image/webp -filter <"''${dir}"/"$file" &>/dev/null && rm "$file"
  notify_user
}

shotarea() {
  # cd "''${dir}" && maim -u -f webp -s -b 2 -c 0.35,0.55,0.85,0.25 -l "$file" && viewnior "''${dir}"/"$file"
  cd "''${dir}" && maim -u -f webp -s | convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage "$file" && xclip -selection clipboard -target image/webp -filter <"''${dir}"/"$file" &>/dev/null
  notify_user
}

if [[ ! -d "$dir" ]]; then
  mkdir -p "$dir"
fi

if [[ "$1" == "now" ]]; then
  shotnow
elif [[ "$1" == "win" ]]; then
  shotwin
elif [[ "$1" == "area" ]]; then
  shotarea
else
  echo -e "Available Options : now win area"
fi

exit 0
