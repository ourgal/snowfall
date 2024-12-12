args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  owner = config.${namespace}.user.name;
  mode = "0400";
  inherit (config.${namespace}.user) host;
  inherit (lib.${namespace}.settings) desktops;
  value = {
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      defaultSopsFile = lib.snowfall.fs.get-file "secrets/${config.${namespace}.user.name}/default.yaml";
      secrets = lib.mkIf (builtins.elem host desktops) {
        "jerry/token" = {
          inherit owner mode;
          path = "/home/${owner}/.local/share/jerry/anilist_token.txt";
        };
        "jerry/id" = {
          inherit owner mode;
          path = "/home/${owner}/.local/share/jerry/anilist_user_id.txt";
        };
        "tg" = {
          inherit owner mode;
          path = "/home/${owner}/.config/tg/conf.py";
        };
        "espanso/mail.yml" = {
          inherit owner mode;
          path = "/home/${owner}/.config/espanso/match/mail.yml";
        };
        "geminicommit" = {
          inherit owner mode;
          path = "/home/${owner}/.config/geminicommit/config.toml";
        };
        "aichat" = {
          inherit owner mode;
          path = "/home/${owner}/.config/aichat/config.yaml";
        };
        "github/token" = {
          inherit owner mode;
          path = "/home/${owner}/.config/github/token";
        };
        "telegram/bot1" = {
          inherit owner mode;
          path = "/home/${owner}/.config/telegram/bot1";
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
