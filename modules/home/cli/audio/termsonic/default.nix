args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) domains;
    in
    {
      nixPkgs = "termsonic";
      confs."termsonic.toml" = {
        BaseURL = "http://${domains.navidrome}";
        Username = lib.strings.fileContents ./username.key;
        Password = lib.strings.fileContents ./password.key;
      };
    }
  )
)
