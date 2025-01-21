args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        namespace
        lib
        config
        ;
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

            # slashslash-fish
            slashslash plugin --unregister buck
            slashslash enable make
          '';
        shellAbbrs = {
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
            description = "mkdir and cd";
            body = ''
              set -l options (fish_opt -s h -l help)
              set options $options (fish_opt -s c -l clip)
              set options $options (fish_opt -s C -l copy)
              set options $options (fish_opt -s p -l parent)
              set options $options (fish_opt -s a -l increase)
              set options $options (fish_opt -s x -l decrease)
              argparse $options -- $argv

              if set -q _flag_help
                echo "Usage: mkcd "(set_color yellow)"[OPTIONS]"(set_color normal)" "(set_color blue)"[DIR]"(set_color normal)""
                echo
                echo "Options:"
                echo "  "(set_color yellow)"-c"(set_color normal)", "(set_color yellow)"--clip"(set_color normal)"       Read clipboard"
                echo "  "(set_color yellow)"-C"(set_color normal)", "(set_color yellow)"--copy"(set_color normal)"       Copy files"
                echo "  "(set_color yellow)"-p"(set_color normal)", "(set_color yellow)"--parent"(set_color normal)"     Parent dir"
                echo "  "(set_color yellow)"-a"(set_color normal)", "(set_color yellow)"--increase"(set_color normal)"   Increase number"
                echo "  "(set_color yellow)"-x"(set_color normal)", "(set_color yellow)"--decrease"(set_color normal)"   Decrease number"
                echo "  "(set_color yellow)"-h"(set_color normal)", "(set_color yellow)"--help"(set_color normal)"       Help"
                return
              end

              test -z $argv[1] && set dir (basename (pwd)) || set dir $argv[1]

              set -q _flag_clip && set dir (xclip -o -sel clip)

              set -q _flag_increase && set dir (echo $dir | perl -pe 's/(\d+)/$1+1/eg' )
              set -q _flag_decrease && set dir (echo $dir | perl -pe 's/(\d+)/$1-1/eg' )

              set -q _flag_copy && xclip-copyfile .

              set -q _flag_parent && set dir "../$dir"

              test -n $dir && mkdir -p $dir && cd $dir && set -q _flag_copy && xclip-pastefile
            '';
          };
          tstickers = {
            description = "download telegram stickers";
            wraps = "tstickers";
            body = ''
              command tstickers --token (cat ${config.xdg.configHome}/telegram/bot1) --pack $argv
            '';
          };
        };
        plugins = lib.${namespace}.mkFishPlugins [
          # keep-sorted start
          "autopair.fish"
          "clownfish"
          "ctrl-z.fish"
          "done"
          "fc-fish"
          "fish-abbreviation-tips"
          "fish-bd"
          "fish-color-scheme-switcher"
          "fish-f"
          "fish-gitnow"
          "fzf"
          "puffer"
          "rgg.fish"
          "slashslash-fish"
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
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
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
      };
      enable = "fzf-help";
    }
  )
)
