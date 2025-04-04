args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule domains mkFileServer;
  value = {
    services.caddy = {
      enable = true;
      virtualHosts = mkFileServer domains.ariang "${pkgs.ariang}/share/ariang";
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
