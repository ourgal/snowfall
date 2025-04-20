args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 3456;
  name = getDirname _name;
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
  _args = { inherit value args; };
in
nixosModule _args
