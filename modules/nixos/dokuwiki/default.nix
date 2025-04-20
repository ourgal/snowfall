args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    ;
  name = getDirname _name;
  value = {
    services.dokuwiki = {
      webserver = "caddy";
      sites = {
        ${domains.${name}} = enabled;
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
