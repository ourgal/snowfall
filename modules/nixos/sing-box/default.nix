args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  apiPort = 9090;
  mixPort = 7890;
  package = pkgs.sing-box;
  value = {

    environment.systemPackages = [ package ];
    services.dbus.packages = [ package ];
    systemd.packages = [ package ];

    systemd.services.sing-box = {
      serviceConfig = {
        User = "sing-box";
        Group = "sing-box";
        StateDirectory = "sing-box";
        StateDirectoryMode = "0700";
        RuntimeDirectory = "sing-box";
        RuntimeDirectoryMode = "0700";
        WorkingDirectory = "/var/lib/sing-box";
        ExecStartPre =
          let
            script = pkgs.writeShellScript "sing-box-pre-start" ''
              ${
                lib.getExe pkgs.${namespace}.sing-box-subscribe-cli
              } --template ${./tun.json} --out /run/sing-box/config.json ${lib.strings.fileContents ./nano.key}
              chown --reference=/run/sing-box /run/sing-box/config.json
            '';
          in
          "+${script}";
        ExecStart = [
          ""
          "${lib.getExe package} -D \${STATE_DIRECTORY} -C \${RUNTIME_DIRECTORY} run"
        ];
      };
      # After= is specified by upstream
      requires = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
    };

    users = {
      users.sing-box = {
        isSystemUser = true;
        group = "sing-box";
        home = "/var/lib/sing-box";
      };
      groups.sing-box = { };
    };

    networking = {
      firewall =
        let
          p = [
            apiPort
            mixPort
            53
          ];
        in
        {
          allowedTCPPorts = p;
          allowedUDPPorts = p;
        };
    };
    ${namespace}.user.ports = [
      apiPort
      mixPort
    ];
  };
  _args = { inherit value args; };
in
nixosModule _args
