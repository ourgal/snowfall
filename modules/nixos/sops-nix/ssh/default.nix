args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  inherit (config.${namespace}.user) host;
  value = {
    sops = {
      secrets = {
        "ssh/${host}/root/public" = {
          owner = "root";
          group = "root";
          mode = "0644";
          path = "/root/.ssh/id_ed25519.pub";
        };
        "ssh/${host}/root/private" = {
          owner = "root";
          group = "root";
          mode = "0600";
          path = "/root/.ssh/id_ed25519";
        };
      };
    };
    systemd.tmpfiles.rules = [ "d '/root/.ssh' 0700 root root - -" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
