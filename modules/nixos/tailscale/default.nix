args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled subnet;
  value = {
    services.tailscale = enabled // {
      authKeyFile = config.sops.secrets."tailscale/authKey".path;
      useRoutingFeatures = "server";
      extraSetFlags = [
        "--advertise-routes=${subnet}"
        "--accept-routes"
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
