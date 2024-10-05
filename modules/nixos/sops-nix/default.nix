{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  user = config.${namespace}.user.name;
  host = config.${namespace}.user.host;
  desktops = lib.${namespace}.settings.desktops;
  value = {
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      defaultSopsFile = lib.snowfall.fs.get-file "secrets/${config.${namespace}.user.name}/default.yaml";
      secrets = lib.mkIf (builtins.elem host desktops) {
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
        "geminicommit" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.config/geminicommit/config.toml";
        };
        "aichat" = {
          owner = user;
          mode = "0600";
          path = "/home/${user}/.config/aichat/config.yaml";
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
