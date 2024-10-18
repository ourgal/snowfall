args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  PORT = "3000";
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
        inherit PORT;
      };
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://pairdrop.zxc.cn".extraConfig = ''
          reverse_proxy http://localhost:${PORT}
        '';
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
