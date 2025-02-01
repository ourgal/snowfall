args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      nixPkgs = "eget";
      files = {
        ".eget.toml" = {
          global = {
            target = "~/.local/bin";
          };
        };
      };
      tmpfiles = [ "d ${config.home.homeDirectory}/.local/bin - - - - -" ];
    }
  )
)
