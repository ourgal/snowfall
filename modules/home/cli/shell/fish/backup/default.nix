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
          plugins = [
            rec {
              name = "fifc";
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
              name = "web-search.fish";
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
              name = "f";
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
              name = "fish-colored-man";
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
    }
  )
)
