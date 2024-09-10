{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
    in
    {
      path = ./.;
      nixPkgs = "eget";
      files = [
        {
          ".eget.toml" = inputs.nix-std.lib.serde.toTOML {
            global = {
              target = "~/.local/bin";
            };
          };
        }
        { ".local/bin/.keep" = ""; }
      ];
    }
  )
)
