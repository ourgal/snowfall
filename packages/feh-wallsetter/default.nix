{
  writeShellApplication,
  lib,
  git,
  feh,
  ...
}:
let
  repo = lib.strings.fileContents ./repo.key;
in
writeShellApplication rec {
  name = "feh-wallsetter";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    git
    feh
  ];

  text = ''
    wallpaperDir="$HOME/Pictures/wallpapers"
    wallpaperGit="${repo}"
    TIMEOUT=720
    if [ -d "$wallpaperDir" ]; then
      cd "$wallpaperDir" || exit
      git pull
    else
      git clone $wallpaperGit "$wallpaperDir"
      chown -R zxc:users "$wallpaperDir"
    fi
    WALLPAPER=$(find "$wallpaperDir" -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
    PREVIOUS=$WALLPAPER
    while true; do
      if [ "$WALLPAPER" == "$PREVIOUS" ]; then
        WALLPAPER=$(find "$wallpaperDir" -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
      else
        PREVIOUS=$WALLPAPER
        feh --bg-center "$WALLPAPER"
        sleep $TIMEOUT
      fi
    done
  '';
}
