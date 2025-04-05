args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8888;
  name = "atuin";
  value = {
    services = {
      atuin = enabled // {
        openFirewall = true;
        openRegistration = true;
        host = "0.0.0.0";
        inherit port;
      };
      postgresql = enabled;
      postgresqlBackup.databases = [ "atuin" ];
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.atuin}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    ${namespace} = {
      user.ports = [ port ];
      firehol.services = [
        {
          inherit name;
          tcp = port;
        }
      ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
