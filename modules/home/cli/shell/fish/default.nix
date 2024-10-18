args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace lib;
    in
    {
      path = ./.;
      progs.fish = {
        shellInit = # fish
          ''
            fish_add_path ~/.local/bin
            fish_add_path ~/.config/emacs/bin
          '';
        interactiveShellInit = # fish
          ''
            set fish_greeting
            scheme set tokyonight
            set -g fish_key_bindings fish_vi_key_bindings
          '';
        shellAbbrs = {
          md = "mkdir -p";
          rd = "rmdir";

          sc = "systemctl";
          scs = "systemctl start";
          sct = "systemctl status";
          scr = "systemctl restart";
          sco = "systemctl stop";

          scu = "systemctl --user";
          scus = "systemctl --user start";
          scut = "systemctl --user status";
          scur = "systemctl --user restart";
          scuo = "systemctl --user stop";

          nms = "nh home switch";
          nos = "nh os switch";
        };
        functions = {
          scroff = {
            body = # fish
              ''
                if test $XDG_CURRENT_DESKTOP = "Hyprland"
                  hyprctl dispatch dpms off
                else
                  xset dpms force off
                end
              '';
            description = "turn screen off";
          };
          live-wallpaper = {
            body = ''
              ${pkgs.xwinwrap}/bin/xwinwrap -ov -fs -- mpv --panscan=1.0 --no-input-default-bindings -loop -no-audio -no-osc -vo x11 -wid WID $argv[1]
            '';
            description = "live wallpaper";
          };
        };
        plugins = lib.${namespace}.mkFishPlugins [
          # keep-sorted start
          "autopair.fish"
          "clownfish"
          "ctrl-z.fish"
          "fish-abbreviation-tips"
          "fish-bd"
          "fish-color-scheme-switcher"
          "fish-done"
          "fish-fzf"
          "fish-gitnow"
          "fish-sponge"
          "fishbang"
          "puffer-fish"
          "rgg.fish"
          "to-fish"
          "todo-comments.fish"
          # keep-sorted end
        ] pkgs;
      };
      env = {
        FZF_LEGACY_KEYBINDINGS = "0";
        FZF_COMPLETE = "2";
        fifc_keybinding = "\\cx";
      };
      files = [
        { "" = ./.gitnow; }
        { "Downloads/youtube/.keep" = ""; }
      ];
    }
  )
)
