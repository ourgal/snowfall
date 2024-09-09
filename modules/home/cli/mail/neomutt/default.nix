{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        switch
        cfgHome
        config
        namespace
        lib
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      nixPkgs = "neomutt";
      confs = {
        neomutt = [
          ./neomuttrc
          ./mappings
          ./settings
          ./colors
          ./mailcap
        ];
      };
      value = {
        sops = lib.mkIf cfg.sops.enable {
          secrets = {
            "neomutt/hotmail" = {
              mode = "0600";
              path = "${args.config.xdg.configHome}/neomutt/accounts/hotmail";
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
