args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    mkFileServer
    ;
  value = {
    services.caddy = enabled // {
      virtualHosts = mkFileServer domains.zashboard "${pkgs.${namespace}.zashboard}";
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
