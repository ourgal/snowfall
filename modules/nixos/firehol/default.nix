args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule mkOpt' cfgNixos;
  inherit (config.${namespace}.user) host;
  inherit (lib.${namespace}.interface.${host}) lan;
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
          myServices = foldl' (acc: v: acc + "\n" + (lib.${namespace}.firehol.mkService v)) "" (
            cfg.services
            ++ [
              {
                name = "mdns";
                udp = 5353;
              }
            ]
          );
          dockerNetworks =
            if config.${namespace}.docker.enable then
              ''
                docker_bridge docker0 172.17.0.0/16
                docker_bridge br-+ 172.18.0.0/16

                containers="docker0,br-+"
                interface "''${containers}" container
                    policy accept
              ''
            else
              "";
        in
        ''
          version 6

          ${myServices}

          ${dockerNetworks}

          interface ${lan} home
              policy reject
              ${mkRule "server" (
                cfg.services
                ++ [
                  "icmp"
                  "icmpv6"
                  "mdns"
                  "ipv6neigh"
                ]
                ++ lib.optional config.services.openssh.enable "ssh"
                ++ lib.optional config.services.nfs.server.enable "nfs"
              )}
              ${mkRule "client" (
                cfg.services
                ++ [
                  "icmp"
                  "icmpv6"
                  "mdns"
                  "ipv6neigh"
                  "ipv6mld"
                  "ipv6router"
                  "dns"
                  "http"
                  "https"
                  "dhcp"
                  "dhcpv6"
                  "multicast"
                ]
                ++ lib.optional config.services.openssh.enable "ssh"
                ++ lib.optional config.services.nfs.server.enable "nfs"
              )}
        '';
    };
    systemd.services.firehol = {
      description = "FireHol a firewall for humans";
      environment._reloadConfig = config.environment.etc."firehol/firehol.conf".source;
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
    environment.systemPackages = [ pkgs.iptables ];
  };
  extraOpts =
    let
      inherit (lib.types) listOf attrs;
    in
    {
      services = mkOpt' (listOf attrs) [ ];
    };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
