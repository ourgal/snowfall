{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
    in
    {
      path = ./.;
      myPkgs = "serpl";
      confs = {
        "serpl/config.toml" = inputs.nix-std.lib.serde.toTOML {
          keybindings = {
            "<Ctrl-q>" = "Quit";
          };
        };
      };
    }
  )
)
