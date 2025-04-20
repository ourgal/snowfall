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
            gd = "cd ~/Downloads";
            "g." = "cd ~/.config";
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
            unmap gL
            unmap gl
            unmap g/
            unmap gr
            unmap gR
            unmap ge
            unmap gm
            unmap gM
            unmap g?
            unmap go
            unmap gs
            unmap gp
            unmap gu
            unmap gv
            unmap gi
          '';
        };
        fish = {
          plugins = lib.${namespace}.mkFishPlugins [ "fish-ranger-cd" ] pkgs;
        };
      };
    }
  )
)
