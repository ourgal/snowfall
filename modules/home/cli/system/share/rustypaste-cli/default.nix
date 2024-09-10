{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
    in
    {
      path = ./.;
      nixPkgs = "rustypaste-cli";
      confs = {
        "rustypaste/config.toml" = inputs.nix-std.lib.serde.toTOML {
          server = {
            address = "http://rustypaste.zxc.cn";
          };
          paste = {
            oneshot = false;
          };
          style = {
            prettify = true;
          };
        };
      };
    }
  )
)
