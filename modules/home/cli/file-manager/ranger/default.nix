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
            set dir (mktemp -t ranger_cd.XXX)
            ranger --choosedir=$dir
            cd (cat $dir) $argv
            rm $dir
            commandline -f repaint
          '';
          description = "ranger cd on exit";
        };
      };
    }
  )
)
