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
  port = 8096;
  name = getDirname path;
  value = {
    services = {
      jellyfin = enabled // {
        openFirewall = true;
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
