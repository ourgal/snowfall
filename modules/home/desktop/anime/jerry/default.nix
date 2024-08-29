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
      nixPkgs = "chafa";
      myPkgs = "jerry";
      value = {
        sops = mkIf cfg.sops.enable {
          secrets = {
            "jerry/token" = {
              mode = "0600";
              path = "${config.xdg.dataHome}/jerry/anilist_token.txt";
            };
            "jerry/id" = {
              mode = "0600";
              path = "${config.xdg.dataHome}/jerry/anilist_user_id.txt";
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
