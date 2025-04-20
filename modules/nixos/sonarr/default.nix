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
  port = 8989;
  name = getDirname _name;
  value = {
    services = {
      sonarr = enabled // {
        openFirewall = true;
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
      borgmatic.settings.source_directories = [ "/var/lib/${name}/.config/NzbDrone/Backups" ];
    };
    systemd.services.sonarr.serviceConfig = {
      SupplementaryGroups = [ "transmission" ];
    };
    systemd.tmpfiles.rules = [ "d /mnt/anime 0770 ${name} ${name} - -" ];
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
