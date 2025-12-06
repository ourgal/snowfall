args:
args.module (
  args
  // (
    let
      inherit (args) lib;
    in
    {
      progs = {
        television.channels.nix-search-tv.metadata.name = lib.mkForce "nix";
        nix-search-tv = {
          settings = {
            indexes = [
              "nixpkgs"
              "home-manager"
              "nur"
              "nixos"
              "darwin"
            ];
            experimental = {
              render_docs_indexes = {
                nvf = "https://notashelf.github.io/nvf/options.html";
              };
            };
          };
        };
      };
    }
  )
)
