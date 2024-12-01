args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "eget";
    files = [
      {
        ".eget.toml" = {
          global = {
            target = "~/.local/bin";
          };
        };
      }
      { ".local/bin/.keep" = ""; }
    ];
  }
)
