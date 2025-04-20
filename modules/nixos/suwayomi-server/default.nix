args:
let
  inherit (args)
    namespace
    lib
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    cfgNixos'
    mkOpt'
    getDirname
    mkFireholRule
    mkCaddyProxy
    domains
    ;
  name = getDirname _name;
  cfg = cfgNixos' config.${namespace} _name;
  value = {
    services = {
      suwayomi-server = enabled // {
        openFirewall = true;
        settings = {
          server = {
            downloadAsCbz = true;
            inherit (cfg) port;
            extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ];
          };
        };
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit (cfg) port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = cfg.port;
    };
  };
  extraOpts = {
    port = mkOpt' lib.types.port 8080;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
