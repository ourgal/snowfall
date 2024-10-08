{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      nixPkgs = "rustypaste-cli";
      confs = {
        "rustypaste/config.toml" = toTOML {
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
