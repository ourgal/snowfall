args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    domains
    mkFileServer
    getDirname
    ;
  name = getDirname path;
  value = {
    services.caddy = {
      virtualHosts = mkFileServer domains.${name} "${pkgs.${namespace}.${name}}";
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
