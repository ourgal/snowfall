args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule enabled;
  Port = 5000;
  user = config.${namespace}.user.name;
  group = "kavita";
  defaultGroup = "kavita";
  defaultUser = "kavita";
  dataDir = "/home/${user}/.config/kavita";
  package = pkgs.kavita;
  settings = {
    inherit Port;
  };
  tokenKeyFile = "/run/secrets/kavita/token";
  settingsFormat = pkgs.formats.json { };
  appsettings = settingsFormat.generate "appsettings.json" ({ TokenKey = "@TOKEN@"; } // settings);
  value = {
    sops.secrets."kavita/token".owner = user;
    systemd.services.kavita = {
      description = "Kavita";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      preStart = ''
        install -m600 ${appsettings} ${lib.escapeShellArg dataDir}/config/appsettings.json
        ${pkgs.replace-secret}/bin/replace-secret '@TOKEN@' \
          ''${CREDENTIALS_DIRECTORY}/token \
          '${dataDir}/config/appsettings.json'
      '';
      serviceConfig = {
        WorkingDirectory = dataDir;
        LoadCredential = [ "token:${tokenKeyFile}" ];
        ExecStart = lib.getExe package;
        Restart = "always";
        User = user;
      };
    };

    systemd.tmpfiles.rules = [
      "d '${dataDir}'        0750 ${user} ${group} - -"
      "d '${dataDir}/config' 0750 ${user} ${group} - -"
    ];

    users.users = lib.mkIf (user == defaultUser) {
      ${defaultUser} = {
        description = "kavita service user";
        inherit group;
      };
    };

    users.groups = lib.mkIf (group == defaultGroup) { ${defaultGroup}.name = defaultGroup; };

    services.caddy = enabled // {
      virtualHosts = {
        "http://kavita.zxc.cn".extraConfig = ''
          reverse_proxy http://localhost:${toString Port}
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
