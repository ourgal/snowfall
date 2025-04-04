args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule domains enabled;
  value = {
    services.dokuwiki = {
      webserver = "caddy";
      sites = {
        ${domains.dokuwiki} = enabled;
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
