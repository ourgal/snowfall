args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 3000;
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
    services.caddy = enabled // {
      virtualHosts = {
        "http://${domains.pairdrop}".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
