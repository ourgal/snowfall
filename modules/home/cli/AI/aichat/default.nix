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
      nixPkgs = "aichat";
      value = {
        sops = {
          secrets = mkIf cfg.sops.enable {
            "aichat" = {
              mode = "0600";
              path = "${config.xdg.configHome}/aichat/config.yaml";
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
