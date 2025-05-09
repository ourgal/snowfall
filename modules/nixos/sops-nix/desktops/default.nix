args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule toTOML;
  owner = config.${namespace}.user.name;
  mode = "0400";
  value = {
    sops = {
      secrets = {
        "jerry/token" = {
          inherit owner mode;
          path = "/home/${owner}/.local/share/jerry/anilist_token.txt";
        };
        "jerry/id" = {
          inherit owner mode;
          path = "/home/${owner}/.local/share/jerry/anilist_user_id.txt";
        };
        phone = { };
        "espanso/mail.yml" = {
          inherit owner mode;
          path = "/home/${owner}/.config/espanso/match/mail.yml";
        };
        gemini = { };
        "last_fm/username" = { };
        "last_fm/password" = { };
        "github/token" = {
          inherit owner mode;
          path = "/home/${owner}/.config/github/token";
        };
        "telegram/bot1" = {
          inherit owner mode;
          path = "/home/${owner}/.config/telegram/bot1";
        };
        "miniflux/fever" = {
          inherit owner mode;
          path = "/home/${owner}/.config/miniflux/fever";
        };
      };
      templates = {
        tg = {
          content = ''
            import os
            PHONE = "+86${config.sops.placeholder.phone}"
            LONG_MSG_CMD = "hx {file_path}"
            MAILCAP_FILE = os.path.expanduser("~/.mailcap")
          '';
          inherit owner mode;
          path = "/home/${owner}/.config/tg/conf.py";
        };
        geminicommit = {
          content = toTOML { api.key = config.sops.placeholder.gemini; };
          inherit owner mode;
          path = "/home/${owner}/.config/geminicommit/config.toml";
        };
        aichat = {
          content = builtins.toJSON {
            model = "deno:gemini-2.0-flash";
            clients = [
              {
                type = "gemini";
                api_key = config.sops.placeholder.gemini;
                extra = {
                  connect_timeout = 120;
                };
              }
              {
                type = "openai-compatible"; # https://github.com/trueai-org/gemini
                name = "deno";
                api_base = lib.strings.fileContents ./deno_domain.key;
                api_key = config.sops.placeholder.gemini;
                models = [ { name = "gemini-2.0-flash"; } ];
                extra = {
                  connect_timeout = 120;
                };
              }
            ];
          };
          inherit owner mode;
          path = "/home/${owner}/.config/aichat/config.yaml";
        };
        "mpdscribble/conf" = {
          content = ''
            [last.fm]
            url = https://post.audioscrobbler.com/
            username = ${config.sops.placeholder."last_fm/username"}
            password = ${config.sops.placeholder."last_fm/password"}
          '';
          inherit owner mode;
          path = "/home/${owner}/.mpdscribble/mpdscribble.conf";
        };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
