args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8080;
  name = getDirname path;
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
