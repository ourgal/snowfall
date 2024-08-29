{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        config
        namespace
        cfgHome
        ;
      inherit (lib) mkIf;
      inherit (lib.${namespace}) switch;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      myPkgs = "geminicommit";
      value = {
        sops = mkIf cfg.sops.enable {
          secrets = {
            "geminicommit" = {
              mode = "0600";
              path = "${config.xdg.configHome}/geminicommit/config.toml";
            };
          };
        };
      };
      extraOpts = {
        sops = switch;
      };
    }
  )
)
