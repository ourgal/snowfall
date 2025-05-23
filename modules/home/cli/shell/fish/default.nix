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
      __done_notification_command =
        if config.${namespace}.user.terminal == "kitty" then
          ''set -gx __done_notification_command "${pkgs.libnotify}/bin/notify-send \$title \$message"''
        else
          null;
      fileManager = "ranger";
    in
    {
      progs.fish = {
        interactiveShellInit = # fish
          ''
            set fish_greeting
            scheme set tokyonight
            set -Ux fish_key_bindings fish_vi_key_bindings

            ${__done_notification_command}

            if test $fish_key_bindings = fish_vi_key_bindings
              bind --mode insert \cf '${fileManager}'
            else
              bind \cf '${fileManager}'
            end
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
          ranger = lib.mkIf (fileManager == "ranger") {
            body = ''
              set tempfile (mktemp -t tmp.XXXXXX)
              set command_argument "map Q chain shell echo %d > $tempfile; quitall"
              command ranger --cmd="$command_argument" $argv
              if test -s $tempfile
                set ranger_pwd (cat $tempfile)
                if test -n $ranger_pwd -a -d $ranger_pwd
                  builtin cd -- $ranger_pwd
                end
              end

              command rm -f -- $tempfile
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
      files = {
        "" = ./.gitnow;
      };
      tmpfiles = [ "d ${config.home.homeDirectory}/Downloads/youtube - - - - -" ];
      sessionPath = [ "$HOME/.local/bin" ];
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
      enable = [
        # keep-sorted start
        "fzf-help"
        "slashslash.fish"
        # keep-sorted end
      ];
    }
  )
)
