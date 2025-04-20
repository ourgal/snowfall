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
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    domains
    ;
  port = 50000;
  name = getDirname _name;
  value = {
    environment.etc = {
      "nix-serve/secret".source = ./secret;
    };
    services = {
      nix-serve = enabled // {
        inherit port;
        secretKeyFile = "/etc/nix-serve/secret";
        package = pkgs.nix-serve-ng;
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
