{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  user = config.${namespace}.user.name;
  folder = "/home/${user}/mnt/nfs";
  value = {
    services.nfs.server =
      enabled
      // {
        exports = "/srv/nfs        192.168.123.0/24(rw,sync,crossmnt,fsid=0,no_subtree_check,no_root_squash,insecure)";
      }
      // enableOpt [ "createMountPoints" ];

    # systemd.tmpfiles.rules = [ "d ${folder} 0770 ${user} users -" ];
    systemd.user.tmpfiles.users.${user}.rules = [ "d ${folder} 0770 ${user} users -" ];

    fileSystems."/srv/nfs" = {
      device = "${folder}";
      options = [ "bind" ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
