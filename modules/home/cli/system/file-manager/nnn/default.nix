{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
    in
    {
      path = ./.;
      progs = [
        {
          fish = {
            functions = {
              n = {
                body = # fish
                  ''
                    # Block nesting of nnn in subshells
                    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
                        echo "nnn is already running"
                        return
                    end

                    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
                    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
                    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
                    # without changing the paths.
                    if test -n "$XDG_CONFIG_HOME"
                        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
                    else
                        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
                    end

                    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
                    # stty start undef
                    # stty stop undef
                    # stty lwrap undef
                    # stty lnext undef

                    # The command function allows one to alias this function to `nnn` without
                    # making an infinitely recursive alias
                    nnn -a $argv

                    if test -e $NNN_TMPFILE
                        source $NNN_TMPFILE
                        rm -- $NNN_TMPFILE
                    end        '';
                description = "support nnn quit and change directory";
              };
              nn = {
                body = # fish
                  ''
                    command nnn -a -S -Q
                  '';
                description = "persistent session for nnn";
              };
            };
          };
        }
        {
          nnn = {
            extraPackages = [
              pkgs.bat
              pkgs.ffmpeg
              pkgs.ffmpegthumbnailer
              pkgs.glow
              pkgs.gnome-epub-thumbnailer
              pkgs.imagemagick
              pkgs.mediainfo
              pkgs.poppler_utils
              pkgs.ueberzugpp
            ];
            bookmarks = {
              D = "~/Documents";
              d = "~/Downloads";
              "." = "~/.config";
            };
            plugins = {
              src =
                (pkgs.fetchFromGitHub {
                  owner = "jarun";
                  repo = "nnn";
                  rev = "v4.9";
                  sha256 = "sha256-g19uI36HyzTF2YUQKFP4DE2ZBsArGryVHhX79Y0XzhU=";
                })
                + "/plugins";
              mappings = {
                z = "autojump";
                Z = "fzcd";
                p = "preview-tui";
                F = "fixname";
                r = "gitroot";
                O = "organize";
              };
            };
          };
        }
      ];
      env = {
        NNN_ARCHIVE = "\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$";
        NNN_TERMINAL = config.${namespace}.user.terminal;
        NNN_PREVIEWIMGPROG = "ueberzug";
      };
    }
  )
)
