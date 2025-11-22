args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.pixiecore = enabled // {
      openFirewall = true;
      dhcpNoBind = true;
      kernel = "https://boot.netboot.xyz";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
