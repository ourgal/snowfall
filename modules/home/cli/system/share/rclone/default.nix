{ ... }@args:
args.module (
  args
  // (
    with args;
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
      dir = "${config.home.homeDirectory}/mnt/alist";
      name = "alist";
    in
    {
      path = ./.;
      nixPkgs = [
        "fuse-common"
        "rclone"
      ];
      value = {
        systemd.user.services.rclone-alist = lib.${namespace}.mkRcloneService { inherit name dir pkgs; };
        sops = {
          secrets = mkIf cfg.sops.enable {
            "rclone" = {
              mode = "0600";
              path = "${config.xdg.configHome}/rclone/rclone.conf";
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
