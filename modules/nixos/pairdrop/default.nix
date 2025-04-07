args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 3000;
  name = getDirname path;
  value = {
    systemd.services.pairdrop = {
      description = "Pairdrop service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Restart = "on-failure";
        ExecStart = "${pkgs.pairdrop}/bin/pairdrop";
      };
      environment = {
        PORT = toString port;
      };
    };
    services.caddy = mkCaddyProxy {
      domain = domains.${name};
      inherit port;
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
