args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) domains;
    in
    {
      nixPkgs = "rustypaste-cli";
      confs."rustypaste/config.toml" = {
        server.address = "http://${domains.rustypaste}";
        paste.oneshot = false;
        style.prettify = true;
      };
    }
  )
)
