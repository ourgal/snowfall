args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    sops = {
      secrets = {
        "cloudflared/cert" = { };
        "cloudflared/xyz" = { };
        "cloudflared/navidrome" = { };
        "cloudflared/jellyfin" = { };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
