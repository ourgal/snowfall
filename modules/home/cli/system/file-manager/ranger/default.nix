{ ... }@args:
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
              src = pkgs.fetchFromGitHub {
                owner = "jchook";
                repo = "ranger-zoxide";
                rev = "281828de060299f73fe0b02fcabf4f2f2bd78ab3";
                hash = "sha256-JEuyYSVa1NS3aftezEJx/k19lwwzf7XhqBCL0jH6VT4=";
              };
            }
            {
              name = "devicons2";
              src = pkgs.fetchFromGitHub {
                owner = "cdump";
                repo = "ranger-devicons2";
                rev = "9606009aa01743768b0f27de0a841f7d8fe196c5";
                hash = "sha256-T96+7dX/7B0BKOJgVDg55+Zonp9sSt6SvmLGknhL8Gg=";
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
