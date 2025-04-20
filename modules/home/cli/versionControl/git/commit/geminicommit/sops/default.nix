args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value.sops.secrets.geminicommit = {
        mode = "0600";
        path = "${config.xdg.configHome}/geminicommit/config.toml";
      };
    }
  )
)
