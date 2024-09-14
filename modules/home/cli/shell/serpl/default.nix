{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      myPkgs = "serpl";
      confs = {
        "serpl/config.toml" = toTOML {
          keybindings = {
            "<Ctrl-q>" = "Quit";
          };
        };
      };
    }
  )
)
