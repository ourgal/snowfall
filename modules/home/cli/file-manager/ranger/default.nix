args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
    in
    {
      progs = {
        ranger = {
          mappings = {
            ex = "extract";
            ec = "compress";
            DD = "shell rip %s";
            gD = "cd ~/Downloads";
            "g." = "cd ~/.config";
            eX = "extract_raw -p123";
          };
          rifle = [
            {
              condition = "else";
              command = ''xdg-open "$1"'';
            }
            {
              condition = "label editor";
              command = ''"$EDITOR" -- "$@"'';
            }
            {
              condition = "label pager";
              command = ''"$PAGER" -- "$@"'';
            }
            {
              condition = "label calibre";
              command = ''"calibre" -- "$@"'';
            }
          ];
          plugins = [
            {
              name = "zoxide";
              inherit (pkgs._sources.ranger-zoxide) src;
            }
            {
              name = "devicons2";
              inherit (pkgs._sources.ranger-devicons2) src;
            }
            {
              name = "archives";
              inherit (pkgs._sources.ranger-archives) src;
            }
          ];
          extraConfig = ''
            default_linemode devicons2
          '';
        };
        fish = {
          plugins = lib.${namespace}.mkFishPlugins [ "fish-ranger-cd" ] pkgs;
        };
      };
    }
  )
)
