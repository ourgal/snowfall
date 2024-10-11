{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs sources;
      inherit (pkgs) fetchFromGitHub;
    in
    {
      path = ./.;
      progs = {
        fish = {
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
          plugins = [
            rec {
              name = "to-fish";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "fish-color-scheme-switcher";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "fish-abbreviation-tips";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "fish-bd";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "done";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "autopair.fish";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "puffer-fish";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "fishbang";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "sponge";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "fzf";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "gitnow";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "ctrl-z";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "todo-comments.fish";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            rec {
              name = "rgg.fish";
              src = fetchFromGitHub {
                inherit (sources.${name}.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
          ];
        };
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
