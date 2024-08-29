{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  user = config.${namespace}.user.name;
  value = {
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      defaultSopsFile = lib.snowfall.fs.get-file "secrets/${config.${namespace}.user.name}/default.yaml";
      secrets = {
        "jerry/token" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.local/share/jerry/anilist_token.txt";
        };
        "jerry/id" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.local/share/jerry/anilist_user_id.txt";
        };
        "tg" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.config/tg/conf.py";
        };
        "espanso/mail.yml" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.config/espanso/match/mail.yml";
        };
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
