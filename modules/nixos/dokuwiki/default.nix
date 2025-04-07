args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    ;
  name = getDirname path;
  value = {
    services.dokuwiki = {
      webserver = "caddy";
      sites = {
        ${domains.${name}} = enabled;
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
