args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    virtualisation.libvirtd = enabled;
    users.users.${user}.extraGroups = [
      "libvirtd"
      "qemu-libvirtd"
    ];
  };
  _args = { inherit value args; };
in
nixosModule _args
