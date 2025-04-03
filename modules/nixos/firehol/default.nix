args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule mkOpt' cfgNixos;
  cfg = cfgNixos config.${namespace} ./.;
  inherit (builtins)
    foldl'
    concatStringsSep
    map
    isAttrs
    replaceStrings
    ;
  value = {
    environment.etc = {
      "firehol/firehol.conf".text =
        let
          mkRule =
            type: services:
            let
              services' = map (v: replaceStrings [ "-" ] [ "_" ] (if (isAttrs v) then v.name else v)) services;
            in
            "${type} \"${concatStringsSep " " services'}\" accept";
          myServices = foldl' (acc: v: acc + "\n" + (lib.${namespace}.firehol.mkService v)) "" cfg.services;
        in
        ''
          version 6

          ${myServices}

          interface eno1 home
              policy reject
              ${mkRule "server" (
                cfg.services
                ++ [
                  "icmp"
                ]
                ++ lib.optional config.services.openssh.enable "ssh"
                ++ lib.optional config.services.nfs.server.enable "nfs"
              )}
              ${mkRule "client" ([
                "all"
              ])}
        '';
    };
    systemd.services.firehol = {
      description = "FireHol a firewall for humans";
      path = [ pkgs.iptables ] ++ lib.optional config.services.nfs.server.enable pkgs.rpcbind;
      partOf = lib.optional config.services.nfs.server.enable "nfs-server.service";
      after = [
        "systemd-modules-load.service"
        "local-fs.target"
      ] ++ lib.optional config.services.nfs.server.enable "nfs-server.service";
      wants = [
        "network-pre.target"
        "systemd-modules-load.service"
        "local-fs.target"
      ];
      before = [ "shutdown.target" ];
      conflicts = [ "shutdown.target" ];
      wantedBy = [ "multi-user.target" ];
      restartIfChanged = true;
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.firehol}/bin/firehol start";
        ExecStop = "${pkgs.firehol}/bin/fireqos stop";
        ExecReload = "${pkgs.firehol}/bin/firehol start";
      };
    };
  };
  extraOpts =
    let
      inherit (lib.types) listOf attrs;
    in
    {
      services = mkOpt' (listOf attrs) [ ];
    };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
