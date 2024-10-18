args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      nixPkgs = "eget";
      files = [
        {
          ".eget.toml" = toTOML {
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
