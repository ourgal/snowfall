args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule domains mkFileServer;
  value = {
    services.caddy = {
      enable = true;
      virtualHosts = mkFileServer domains.cyberchef "${pkgs.cyberchef}/share/cyberchef";
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
