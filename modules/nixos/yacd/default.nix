args:
let
  inherit (args)
    namespace
    lib
    pkgs
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    domains
    mkFileServer
    getDirname
    ;
  name = getDirname _name;
  value = {
    services.caddy = {
      virtualHosts = mkFileServer domains.${name} "${pkgs.${namespace}.${name}}";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
