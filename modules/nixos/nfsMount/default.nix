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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
