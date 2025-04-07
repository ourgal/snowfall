args:
let
  inherit (args) namespace lib;
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
  name = getDirname path;
  value = {
    services = {
      immich = enabled // {
        openFirewall = true;
        inherit port;
        machine-learning = disabled;
      };
      caddy = mkCaddyProxy domains.${name} port;
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
