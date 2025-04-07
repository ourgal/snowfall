args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    domains
    ;
  port = 50000;
  name = getDirname path;
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
