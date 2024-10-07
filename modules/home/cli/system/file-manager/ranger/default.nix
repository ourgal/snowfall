{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs sources;
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
              src = pkgs.fetchFromGitHub {
                inherit (sources.ranger-zoxide.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
            {
              name = "devicons2";
              src = pkgs.fetchFromGitHub {
                inherit (sources.ranger-devicons2.src)
                  owner
                  repo
                  rev
                  sha256
                  ;
              };
            }
          ];
          extraConfig = ''
            default_linemode devicons2
          '';
        };
        fish = {
          functions = {
            ra = {
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
        };
      };
    }
  )
)
