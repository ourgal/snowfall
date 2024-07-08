{
  writeShellApplication,
  lib,
  broot,
  gnumake,
  pkgs,
  namespace,
  ...
}:
let
  zellijEnter = "zellij action write 13";
in
writeShellApplication rec {
  name = "helix-zellij";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    broot
    gnumake
  ];

  text = # bash
    ''
      function zellij_popup() {
        zellij run --floating -x 5% -y 5% --width 90% --height 90% -- $1
      }

      function popup_lazygit() {
        zellij_popup lazygit
      }

      function popup_lf() {
        local TEMP=$(mktemp)
        zellij_popup "lf -selection-path=$TEMP"
        echo >> $TEMP
        while read -r line
        do
          zellij action focus-previous-pane
          zellij action write-chars ":open $line"
          ${zellijEnter}
        done < "$TEMP"
      }

      function popup_broot() {
        local TEMP="/tmp/broot_selection_path"
        local broot_cmd="broot --conf $HOME/.config/broot/select.hjson"

        if git rev-parse >/dev/null 2>/dev/null; then
          local git_root=$(git rev-parse --show-toplevel)
          zellij run --cwd "$git_root" --floating -x 5% -y 5% --width 90% --height 90% -- "$broot_cmd"
        else
          zellij_popup "$broot_cmd"
        fi

        if test -e "$TEMP"; then
          while read -r line
          do
            zellij action write-chars ":open $line"
            ${zellijEnter}
          done < "$TEMP"
          rm $TEMP
        fi
      }

      function popup_search() {
        zellij action write-chars "_* *"
        ${zellijEnter}
      }

      function popup_livegrep() {
          # live-grep: interactive search, output is "file:line" pairs
          FILE_PATHS=$(${pkgs.${namespace}.live-grep}/bin/live-grep --exit-on-execution $1 | tr '\n' ' ' | sed 's/ *$//')

          if [[ -n "$FILE_PATHS" ]]; then
              zellij action focus-previous-pane
              zellij action write 84
              zellij action write-chars "o $FILE_PATHS"
              ${zellijEnter}
          fi
      }

      function popup_make() {
      	zellij_popup "make|ov"
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
        popup_livegrep $2
        ;;
        "make")
      	popup_make
      	;;
      esac
    '';
}
