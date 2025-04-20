args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    disabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 2283;
  name = getDirname _name;
  value = {
    services = {
      immich = enabled // {
        openFirewall = true;
        inherit port;
        machine-learning = disabled;
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
