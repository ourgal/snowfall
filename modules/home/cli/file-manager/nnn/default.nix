args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
    in
    {
      path = ./.;
      progs = {
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
              D = "dragdrop";
            };
          };
        };
      };
      env = {
        NNN_ARCHIVE = "\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$";
        NNN_TERMINAL = config.${namespace}.user.terminal;
        NNN_PREVIEWIMGPROG = "ueberzug";
      };
    }
  )
)
