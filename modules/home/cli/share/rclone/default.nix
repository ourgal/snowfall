{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        config
        namespace
        pkgs
        ;
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
        systemd.user.tmpfiles.rules = [ "d ${dir} - - - -" ];
        systemd.user.services.rclone-alist = lib.${namespace}.mkRcloneService { inherit name dir pkgs; };
      };
    }
  )
)
