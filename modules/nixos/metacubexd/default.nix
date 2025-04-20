args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule domains mkFileServer;
  value = {
    services.caddy = {
      virtualHosts = mkFileServer domains.metacubexd "${pkgs.metacubexd}";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
