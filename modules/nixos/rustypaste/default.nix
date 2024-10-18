args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  port = 8000;
  user = "rustypaste";
  dataDir = "/var/lib/rustypaste";
  value = {
    systemd.tmpfiles.rules = [ "d '${dataDir}' 0750 ${user} ${user} - -" ];
    systemd.services.rustypaste = {
      description = "Rustypaste service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Restart = "on-failure";
        preStart = ''
          umask u=rwx,g=rx,o=
          cat > "${dataDir}/config.toml" <<EOF
          [config]
          refresh_rate = "1s"

          [server]
          address = "127.0.0.1:8000"
          #url = "https://paste.example.com"
          #workers=4
          max_content_length = "10MB"
          upload_path = "./upload"
          timeout = "30s"
          expose_version = false
          expose_list = false
          #auth_tokens = [
          #  "super_secret_token1",
          #  "super_secret_token2",
          #]
          #delete_tokens = [
          #  "super_secret_token1",
          #  "super_secret_token3",
          #]
          handle_spaces = "replace" # or "encode"

          [landing_page]
          text = """
          ┬─┐┬ ┬┌─┐┌┬┐┬ ┬┌─┐┌─┐┌─┐┌┬┐┌─┐
          ├┬┘│ │└─┐ │ └┬┘├─┘├─┤└─┐ │ ├┤
          ┴└─└─┘└─┘ ┴  ┴ ┴  ┴ ┴└─┘ ┴ └─┘

          Submit files via HTTP POST here:
              curl -F 'file=@example.txt' <server>
          This will return the URL of the uploaded file.

          The server administrator might remove any pastes that they do not personally
          want to host.

          If you are the server administrator and want to change this page, just go
          into your config file and change it! If you change the expiry time, it is
          recommended that you do.

          By default, pastes expire every hour. The server admin may or may not have
          changed this.

          Check out the GitHub repository at https://github.com/orhun/rustypaste
          Command line tool is available  at https://github.com/orhun/rustypaste-cli
          """
          #file = "index.txt"
          content_type = "text/plain; charset=utf-8"

          [paste]
          random_url = { type = "petname", words = 2, separator = "-" }
          #random_url = { type = "alphanumeric", length = 8 }
          #random_url = { type = "alphanumeric", length = 6, suffix_mode = true }
          default_extension = "txt"
          mime_override = [
            { mime = "image/jpeg", regex = "^.*\\.jpg$" },
            { mime = "image/png", regex = "^.*\\.png$" },
            { mime = "image/svg+xml", regex = "^.*\\.svg$" },
            { mime = "video/webm", regex = "^.*\\.webm$" },
            { mime = "video/x-matroska", regex = "^.*\\.mkv$" },
            { mime = "application/octet-stream", regex = "^.*\\.bin$" },
            { mime = "text/plain", regex = "^.*\\.(log|txt|diff|sh|rs|toml)$" },
          ]
          mime_blacklist = [
            "application/x-dosexec",
            "application/java-archive",
            "application/java-vm",
          ]
          duplicate_files = true
          # default_expiry = "1h"
          delete_expired_files = { enabled = true, interval = "1h" }
          EOF
        '';
        ExecStart = "${pkgs.rustypaste}/bin/rustypaste";
        WorkingDirectory = dataDir;
      };
      environment = {
        CONFIG = "${dataDir}/config.toml";
        SERVER__ADDRESS = "0.0.0.0:${toString port}";
      };
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://rustypaste.zxc.cn".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };

    users = {
      users.${user} = {
        description = "rustypaste service user";
        isSystemUser = true;
        group = user;
        home = dataDir;
      };
      groups.${user} = { };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
