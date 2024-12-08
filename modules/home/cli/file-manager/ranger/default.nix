args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = {
        ranger = {
          mappings = {
            e = "edit";
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
          ];
          extraConfig = ''
            default_linemode devicons2
          '';
        };
        fish.functions.ra = {
          body = ''
            set dir $HOME/.config/ranger/.rangerdir
            ranger --choosedir=$dir $argv
            cd (cat $dir)
            echo -n > $dir
            # commandline -f repaint
          '';
          description = "ranger cd on exit";
        };
      };
    }
  )
)
