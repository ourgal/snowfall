args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8191;
  name = getDirname path;
  value = {
    services = {
      flaresolverr = enabled // {
        openFirewall = true;
        package = pkgs.nur.repos.xddxdd.flaresolverr-21hsmw;
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
