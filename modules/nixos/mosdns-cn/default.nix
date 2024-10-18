args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    environment = {
      systemPackages = with pkgs.${namespace}; [ mosdns-cn ];
      etc = {
        "mosdns-cn/config.yaml".text = builtins.toJSON {
          server_addr = ":25353";
          cache_size = 0;
          lazy_cache_ttl = 86400;
          lazy_cache_reply_ttl = 30;
          redis_cache = "redis://localhost:6379";
          min_ttl = 0;
          max_ttl = 0;
          hosts = [ "hosts" ];
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
          local_ip = [ "geoip.dat:cn" ];
          local_domain = [ "geosite.dat:cn" ];
          local_latency = 50;
          remote_upstream = [
            "https://8.8.4.4/dns-query"
            "https://doh.apad.pro/dns-query"
          ];
          remote_domain = [ "geosite.dat:geolocation-!cn" ];
          working_dir = "/etc/mosdns-cn";
          cd2exe = false;
        };
        "mosdns-cn/hosts".text = "domain:zxc.cn 192.168.123.206";
        "mosdns-cn/geoip.dat".source = builtins.fetchurl {
          url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202408052210/geoip.dat";
          sha256 = "0w9fkf4c8q7h9z0sz8yqzkp58s35h1p7v7qari1z3fhcamjw3rdh";
        };
        "mosdns-cn/geosite.dat".source = builtins.fetchurl {
          url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202408052210/geosite.dat";
          sha256 = "0mzqm0zwsfrycpmwnww85r543v99k6q1jzc483gdnj86jqrvzn4v";
        };
      };
    };
    systemd.services.mosdns-cn = {
      description = "mosdns-cn";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.${namespace}.mosdns-cn}/bin/mosdns-cn --config /etc/mosdns-cn/config.yaml";
        Restart = "always";
      };
    };
    services.redis.servers.mosdns-cn = enabled // {
      port = 6379;
    };
    networking.firewall = {
      allowedTCPPorts = [ 25353 ];
      allowedUDPPorts = [ 25353 ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
