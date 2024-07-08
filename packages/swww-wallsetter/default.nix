{
  writeShellApplication,
  lib,
  swww,
  git,
  ...
}:
let
  repo = lib.strings.fileContents ./repo.key;
in
writeShellApplication rec {
  name = "swww-wallsetter";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    swww
    git
  ];

  text = ''
    wallpaperDir="$HOME/Pictures/wallpapers"
    wallpaperGit="${repo}"
    swww init
    TIMEOUT=720
    TRANSITION1="--transition-type wave --transition-angle 120 --transition-step 30"
    TRANSITION2="--transition-type wipe --transition-angle 30 --transition-step 30"
    TRANSITION3="--transition-type center --transition-step 30"
    TRANSITION4="--transition-type outer --transition-pos 0.3,0.8 --transition-step 30"
    TRANSITION5="--transition-type wipe --transition-angle 270 --transition-step 30"
    WALLPAPER=$(find "$wallpaperDir" -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
    PREVIOUS=$WALLPAPER
    if [ -d "$wallpaperDir" ]; then
      cd "$wallpaperDir" || exit
      git pull
    else
      git clone $wallpaperGit "$wallpaperDir"
      chown -R zxc:users "$wallpaperDir"
    fi
    while true; do
      if [ "$WALLPAPER" == "$PREVIOUS" ]; then
        WALLPAPER=$(find "$wallpaperDir" -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
      else
        PREVIOUS=$WALLPAPER
        NUM=$(shuf -e 1 2 3 4 5 -n 1)
        case $NUM in
        1)
          TRANSITION=$TRANSITION1
          ;;
        2)
          TRANSITION=$TRANSITION2
          ;;
        3)
          TRANSITION=$TRANSITION3
          ;;
        4)
          TRANSITION=$TRANSITION4
          ;;
        5)
          TRANSITION=$TRANSITION5
          ;;
        esac
        swww img "$WALLPAPER" "$TRANSITION"
        sleep $TIMEOUT
      fi
    done
  '';
}
