args:
args.module (
  args
  // {
    progs.fish = {
      interactiveShellInit = # fish
        ''
          set fish_greeting
          scheme set tokyonight
          set -Ux fish_key_bindings fish_vi_key_bindings
        '';
    };
    sessionPath = [ "$HOME/.local/bin" ];
    enable = [
      # keep-sorted start
      "aliases"
      "autopair.fish"
      "clownfish"
      "ctrl-z.fish"
      "done"
      "exercism-cli-fish-wrapper"
      "fc-fish"
      "fish-abbreviation-tips"
      "fish-bd"
      "fish-color-scheme-switcher"
      "fish-f"
      "fish-gitnow"
      "functions"
      "fzf"
      "fzf-help"
      "puffer"
      "rgg.fish"
      "slashslash.fish"
      "sponge"
      "to-fish"
      "todo-comments.fish"
      # keep-sorted end
    ];
  }

)
