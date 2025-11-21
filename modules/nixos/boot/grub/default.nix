args:
let
  inherit (args) namespace lib host;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.loader.grub =
      if host == "office1" then
        {
          efiSupport = true;
          efiInstallAsRemovable = true;
          device = "nodev";
        }
      else
        { device = "/dev/sda"; };
  };
  _args = { inherit value args; };
in
nixosModule _args
