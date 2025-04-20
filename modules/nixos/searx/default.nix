args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8080;
  name = getDirname _name;
  value = {
    services = {
      searx = enabled // {
        settings = {
          server = {
            inherit port;
            bind_address = "0.0.0.0";
            secret_key = lib.strings.fileContents ./secret_key.key;
          };
        };
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
