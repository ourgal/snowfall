args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    enabled
    ip
    domain
    ;
  port = 53;
  redisPort = 6379;
  geoip = pkgs._sources.v2ray-rules-dat-geoip.src;
  geosite = pkgs._sources.v2ray-rules-dat-geosite.src;
  config = pkgs.writeText "config.yaml" (
    builtins.toJSON {
      server_addr = ":${toString port}";
      cache_size = 0;
      lazy_cache_ttl = 86400;
      lazy_cache_reply_ttl = 30;
      redis_cache = "redis://localhost:${toString redisPort}";
      min_ttl = 0;
      max_ttl = 0;
      hosts = [ "${hosts}" ];
      blacklist_domain = [ ];
      insecure = false;
      ca = [ ];
      debug = false;
      log_file = "";
      upstream = [ ];
      local_upstream = [
        "https://223.5.5.5/dns-query"
        "https://doh.apad.pro/dns-query"
      ];
      local_ip = [ "${geoip}:cn" ];
      local_domain = [ "${geosite}:cn" ];
      local_latency = 50;
      remote_upstream = [
        "https://8.8.4.4/dns-query"
        "https://doh.apad.pro/dns-query"
      ];
      remote_domain = [ "${geosite}:geolocation-!cn" ];
      cd2exe = false;
    }
  );
  hosts = pkgs.writeText "hosts" "domain:${domain} ${ip.brix}";
  value = {
    environment = {
      systemPackages = with pkgs.${namespace}; [ mosdns-cn ];
    };
    systemd.services.mosdns-cn = {
      description = "mosdns-cn";
      requires = [ "network-online.target" ];
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      environment._reloadConfig = "${config}${geoip}${geosite}";
      serviceConfig = rec {
        Type = "simple";
        ExecStart = "${pkgs.${namespace}.mosdns-cn}/bin/mosdns-cn --config ${config}";
        Restart = "always";
        DynamicUser = true;
        StateDirectory = "mosdns-cn";
        WorkingDirectory = "/var/lib/mosdns-cn";
        RuntimeDirectory = "mosdns-cn";
        RuntimeDirectoryMode = "0750";
        ProcSubset = "pid";
        ProtectProc = "invisible";
        UMask = "0027";
        CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
        AmbientCapabilities = CapabilityBoundingSet;
        ProtectHome = true;
        PrivateDevices = true;
        ProtectHostname = true;
        ProtectClock = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        RestrictAddressFamilies = [
          "AF_UNIX"
          "AF_INET"
          "AF_INET6"
        ];
        RestrictNamespaces = true;
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        RestrictRealtime = true;
        RemoveIPC = true;
        PrivateMounts = true;
        SystemCallArchitectures = "native";
        SystemCallFilter = [
          "@system-service"
          "~@cpu-emulation @debug @keyring @module @mount @obsolete @privileged @raw-io @reboot @setuid @swap"
        ];

      };
    };
    services.redis.servers.mosdns-cn = enabled // {
      port = redisPort;
    };
    networking.firewall = {
      allowedTCPPorts = [ port ];
      allowedUDPPorts = [ port ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
