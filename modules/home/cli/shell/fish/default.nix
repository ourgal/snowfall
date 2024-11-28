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
            set -Ux fish_key_bindings fish_vi_key_bindings
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
          mkcd = {
            body = ''
              set -l options (fish_opt -s h -l help)
              set options $options (fish_opt -s c -l clip)
              set options $options (fish_opt -s p -l parent)
              argparse $options -- $argv

              set dir $argv[1]

              if set -q _flag_help
                echo "Usage: mkcd [OPTIONS] [DIR]"
                echo
                echo "Options:"
                echo "  -c, --clip     Read clipboard"
                echo "  -p, --parent   Parent dir"
                echo "  -h, --help     Help"
                return
              end

              if set -q _flag_clip
                set dir (xclip -o -sel clip)
              end

              if set -q _flag_parent
                set dir "../$dir"
              end

              if test -n "$dir"
                mkdir -p "$dir"
                cd "$dir"
              end
            '';
            description = "mkdir and cd";
          };
          cpcd = {
            body = ''
              set -l options (fish_opt -s h -l help)
              set options $options (fish_opt -s c -l clip)
              set options $options (fish_opt -s p -l parent)
              argparse $options -- $argv

              set dir $argv[1]

              if set -q _flag_help
                echo "Usage: cpcd [OPTIONS] [DIR]"
                echo
                echo "Options:"
                echo "  -c, --clip     Read clipboard"
                echo "  -p, --parent   Parent dir"
                echo "  -h, --help     Help"
                return
              end

              if set -q _flag_clip
                set dir (xclip -o -sel clip)
              end

              if set -q _flag_parent
                set dir "../$dir"
              end

              if test -n "$dir"
                cb cp .
                mkdir -p "$dir"
                cd "$dir"
                cb p
              end
            '';
            description = "copy and cd";
          };
        };
        plugins = lib.${namespace}.mkFishPlugins [
          # keep-sorted start
          "autopair.fish"
          "clownfish"
          "ctrl-z.fish"
          "done"
          "enhancd"
          "fc-fish"
          "fish-abbreviation-tips"
          "fish-bd"
          "fish-color-scheme-switcher"
          "fish-f"
          "fish-gitnow"
          "fzf"
          "puffer"
          "rgg.fish"
          "sponge"
          "to-fish"
          "todo-comments.fish"
          # keep-sorted end
        ] pkgs;
      };
      env = {
        FZF_LEGACY_KEYBINDINGS = "1";
        FZF_COMPLETE = "2";
        fifc_keybinding = "\\cx";
        ENHANCD_COMMAND = "ecd";
      };
      files = [
        { "" = ./.gitnow; }
        { "Downloads/youtube/.keep" = ""; }
      ];
      enable = "fzf-help";
    }
  )
)
