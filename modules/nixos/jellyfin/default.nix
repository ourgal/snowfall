args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    xyzDomains
    ;
  port = 8096;
  name = getDirname _name;
  value = {
    services = {
      jellyfin = enabled // {
        openFirewall = true;
      };
      caddy = {
        virtualHosts = {
          "http://${domains.${name}}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
          "${xyzDomains.${name}}".extraConfig = ''
            reverse_proxy :${toString port}
          '';
        };
      };
      borgmatic.settings = {
        source_directories = [ "/var/lib/${name}" ];
        exclude_patterns = [ "/var/lib/${name}/metadata" ];
      };
    };

    systemd.services.jellyfin = {
      serviceConfig = {
        SupplementaryGroups = [
          "syncthing"
          "sonarr"
        ];
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
