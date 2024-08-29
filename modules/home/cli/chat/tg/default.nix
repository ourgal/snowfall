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
      nixPkgs = "tg";
      value = {
        sops = mkIf cfg.sops.enable {
          secrets = {
            "tg" = {
              mode = "0600";
              path = "${config.xdg.configHome}/tg/conf.py";
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
