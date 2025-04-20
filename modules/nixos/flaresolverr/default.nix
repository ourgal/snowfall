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
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8191;
  name = getDirname _name;
  value = {
    services = {
      flaresolverr = enabled // {
        openFirewall = true;
        package = pkgs.nur.repos.xddxdd.flaresolverr-21hsmw;
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
