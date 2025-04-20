args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule ip;
  value = {
    fileSystems."/mnt/nfs/anime" = {
      device = "${ip.brix}:/anime";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
