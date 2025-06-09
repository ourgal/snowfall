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
    domains
    xyzDomains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 4533;
  name = getDirname _name;
  MusicFolder = "${config.services.syncthing.dataDir}/music";
  value = {
    services = {
      navidrome = enabled // {
        openFirewall = true;
        settings = {
          inherit MusicFolder;
          Port = port;
        };
      };
      caddy =
        (mkCaddyProxy {
          domain = domains.${name};
          inherit port;
        })
        // {
          virtualHosts = {
            "${xyzDomains.${name}}".extraConfig = ''
              reverse_proxy :${toString port}
            '';
          };
        };
      borgmatic.settings.source_directories = [ "/var/lib/${name}" ];
    };
    systemd.services.navidrome.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
