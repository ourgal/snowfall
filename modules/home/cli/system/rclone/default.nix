{ ... }@args:
args.module (
  args
  // (
    with args;
    let
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
          secrets = {
            "rclone" = {
              mode = "0600";
              path = "${config.xdg.configHome}/rclone/rclone.conf";
            };
          };
        };
      };
    }
  )
)
