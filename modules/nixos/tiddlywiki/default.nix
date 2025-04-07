args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 3456;
  name = getDirname path;
  value = {
    services = {
      tiddlywiki = enabled // {
        listenOptions = { inherit port; };
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
