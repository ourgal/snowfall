args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    cfgNixos
    mkOpt'
    getDirname
    mkFireholRule
    mkCaddyProxy
    domains
    ;
  name = getDirname path;
  cfg = cfgNixos config.${namespace} path;
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
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
