args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    _sources
    ip
    domain
    getDirname
    mkFireholRule
    ;
  inherit (config.${namespace}.user) duckdns;
  port = 53;
  name = getDirname _name;
  geoLists =
    pkgs.runCommand "mosdns_config"
      {
        src = [
          pkgs._sources.v2ray-rules-dat-geoip.src
          pkgs._sources.v2ray-rules-dat-geosite.src
        ];
        nativeBuildInputs = [ pkgs.${namespace}.v2dat ];
      }
      ''
        mkdir $out
        for _src in $src; do
          cp "$_src" $(stripHash "$_src")
        done
        v2dat unpack geoip geoip.dat -o $out -f cn -f private
        v2dat unpack geosite geosite.dat -o $out -f category-ads-all -f geolocation-!cn -f gfw -f cn -f private
      '';
  conf = pkgs.writeText "config.yaml" (
    builtins.toJSON {
      "api" = {
        "http" = "0.0.0.0:8338";
      };
      "include" = [
        "${dat_exec}"
        "${dns}"
      ];
      "log" = {
        "file" = "/var/lib/mosdns/app.log";
        "level" = "debug";
      };
      "plugins" = [
        {
          "args" = [
            { "exec" = "query_summary reject_null_domain"; }
            { "exec" = "$reject_3"; }
          ];
          "tag" = "reject_null_domain";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary reject_qtype65"; }
            { "exec" = "$reject_3"; }
          ];
          "tag" = "reject_qtype65";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary reject_ad"; }
            { "exec" = "$reject_3"; }
          ];
          "tag" = "reject_ad";
          "type" = "sequence";
        }
        {
          "args" = {
            "always_standby" = true;
            "primary" = "google";
            "secondary" = "cloudflare";
            "threshold" = 700;
          };
          "tag" = "dns_nocn";
          "type" = "fallback";
        }
        {
          "args" = {
            "always_standby" = true;
            "primary" = "ali";
            "secondary" = "dnspod";
            "threshold" = 500;
          };
          "tag" = "dns_cn";
          "type" = "fallback";
        }
        {
          "args" = [
            { "exec" = "query_summary dns_nocn"; }
            { "exec" = "$dns_nocn"; }
          ];
          "tag" = "dns_nocn_seq";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary dns_cn"; }
            { "exec" = "$dns_cn"; }
          ];
          "tag" = "dns_cn_seq";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary local"; }
            { "exec" = "$local"; }
          ];
          "tag" = "local_seq";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary fallback"; }
            { "exec" = "$dns_cn"; }
          ];
          "tag" = "fallback_seq";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "query_summary other"; }
            { "exec" = "$dns_cn"; }
          ];
          "tag" = "other_seq";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "$ecs_cn"; }
            { "exec" = "$dns_cn_seq"; }
            {
              "exec" = "drop_resp";
              "matches" = "!resp_ip $geoip_cn";
            }
          ];
          "tag" = "query_cn";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "$no_ecs"; }
            { "exec" = "prefer_ipv4"; }
            { "exec" = "$dns_nocn_seq"; }
            {
              "exec" = "drop_resp";
              "matches" = "resp_ip $geoip_cn";
            }
          ];
          "tag" = "query_nocn";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "$forward_remote"; } ];
          "tag" = "query_gfw";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "prefer_ipv4"; }
            { "exec" = "$fallback_seq"; }
          ];
          "tag" = "query_fallback";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "$cache_lan"; }
            {
              "exec" = "return";
              "matches" = "has_resp";
            }
            { "exec" = "$local_seq"; }
          ];
          "tag" = "query_lan";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "$other_seq"; } ];
          "tag" = "query_other";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "$ttl_1h"; }
            { "exec" = "accept"; }
          ];
          "tag" = "pre_handle";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "$ttl_5m"; }
            { "exec" = "accept"; }
          ];
          "tag" = "main_handle";
          "type" = "sequence";
        }
        {
          "args" = [
            {
              "exec" = "goto pre_handle";
              "matches" = "has_resp";
            }
          ];
          "tag" = "has_resp_pre";
          "type" = "sequence";
        }
        {
          "args" = [
            {
              "exec" = "goto main_handle";
              "matches" = "has_resp";
            }
          ];
          "tag" = "has_resp_main";
          "type" = "sequence";
        }
        {
          "args" = [
            {
              "exec" = "$reject_qtype65";
              "matches" = "qtype 65";
            }
            {
              "exec" = "$reject_null_domain";
              "matches" = "qname keyword::";
            }
            {
              "exec" = "$query_other";
              "matches" = "qtype 12";
            }
            {
              "exec" = "$query_other";
              "matches" = "qtype 255";
            }
            {
              "exec" = "$query_lan";
              "matches" = "ptr_ip $geoip_private";
            }
            { "exec" = "$selfhost"; }
            { "exec" = "jump has_resp_pre"; }
          ];
          "tag" = "pre_sequence";
          "type" = "sequence";
        }
        {
          "args" = [
            {
              "exec" = "$reject_ad";
              "matches" = "qname $geosite_ads-all";
            }
            { "exec" = "$cache_wan"; }
            { "exec" = "jump has_resp_main"; }
            {
              "exec" = "$query_cn";
              "matches" = "qname $geosite_cn";
            }
            { "exec" = "jump has_resp_main"; }
            {
              "exec" = "$query_gfw";
              "matches" = "qname $geosite_gfw";
            }
            { "exec" = "jump has_resp_main"; }
            {
              "exec" = "$query_nocn";
              "matches" = "qname $geosite_location-!cn";
            }
            { "exec" = "jump has_resp_main"; }
            { "exec" = "$no_ecs"; }
            { "exec" = "$query_fallback"; }
            { "exec" = "jump has_resp_main"; }
          ];
          "tag" = "main_sequence";
          "type" = "sequence";
        }
        {
          "args" = [
            { "exec" = "metrics_collector metrics"; }
            { "exec" = "$pre_sequence"; }
            { "exec" = "$main_sequence"; }
          ];
          "tag" = "sequence";
          "type" = "sequence";
        }
        {
          "args" = {
            "entry" = "sequence";
            "listen" = ":${toString port}";
          };
          "type" = "udp_server";
        }
        {
          "args" = {
            "entry" = "sequence";
            "listen" = ":${toString port}";
          };
          "type" = "tcp_server";
        }
      ];
    }
  );
  dns = pkgs.writeText "dns.yaml" (
    builtins.toJSON {
      "plugins" = [
        {
          "args" = {
            "concurrent" = 3;
            "upstreams" = [
              {
                "addr" = "https://dns.google/dns-query";
                "dial_addr" = "8.8.4.4";
              }
              {
                "addr" = "tls://dns.google";
                "dial_addr" = "8.8.4.4";
                "enable_pipeline" = true;
              }
            ];
          };
          "tag" = "google";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 3;
            "upstreams" = [
              {
                "addr" = "https://1.1.1.1/dns-query";
                "dial_addr" = "1.1.1.1";
              }
              {
                "addr" = "tls://1.1.1.1";
                "dial_addr" = "1.1.1.1";
                "enable_pipeline" = true;
              }
              {
                "addr" = "tls://1.0.0.1";
                "dial_addr" = "1.0.0.1";
                "enable_pipeline" = true;
              }
            ];
          };
          "tag" = "cloudflare";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 2;
            "upstreams" = [
              {
                "addr" = "https://dns.nextdns.io";
                "dial_addr" = "45.90.28.186";
              }
              {
                "addr" = "tls://dns.nextdns.io";
                "dial_addr" = "45.90.28.186";
                "enable_pipeline" = true;
              }
            ];
          };
          "tag" = "nextdns";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 2;
            "upstreams" = [
              {
                "addr" = "https://dns11.quad9.net/dns-query";
                "dial_addr" = "9.9.9.11";
              }
              {
                "addr" = "tls://dns11.quad9.net";
                "dial_addr" = "9.9.9.11";
                "enable_pipeline" = true;
              }
            ];
          };
          "tag" = "quad9";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 1;
            "upstreams" = [ { "addr" = "${ip.router}:1053"; } ];
          };
          "tag" = "forward_remote";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 3;
            "upstreams" = [
              {
                "addr" = "https://dns.alidns.com/dns-query";
                "dial_addr" = "223.6.6.6";
              }
              {
                "addr" = "tls://dns.alidns.com";
                "dial_addr" = "223.5.5.5";
                "enable_pipeline" = true;
              }
              {
                "addr" = "https://dns.alidns.com/dns-query";
                "dial_addr" = "223.5.5.5";
              }
            ];
          };
          "tag" = "ali";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 3;
            "upstreams" = [
              {
                "addr" = "https://doh.pub/dns-query";
                "dial_addr" = "1.12.12.12";
              }
              {
                "addr" = "https://doh.pub/dns-query";
                "dial_addr" = "120.53.53.53";
              }
              {
                "addr" = "tls://dot.pub";
                "dial_addr" = "1.12.12.12";
                "enable_pipeline" = true;
              }
              {
                "addr" = "tls://dot.pub";
                "dial_addr" = "120.53.53.53";
                "enable_pipeline" = true;
              }
            ];
          };
          "tag" = "dnspod";
          "type" = "forward";
        }
        {
          "args" = {
            "concurrent" = 1;
            "upstreams" = [ { "addr" = "udp://${ip.router}:53"; } ];
          };
          "tag" = "local";
          "type" = "forward";
        }
        {
          "args" = [ { "exec" = "reject 2"; } ];
          "tag" = "reject_2";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "reject 3"; } ];
          "tag" = "reject_3";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "reject 5"; } ];
          "tag" = "reject_5";
          "type" = "sequence";
        }
      ];
    }
  );
  dat_exec = pkgs.writeText "dat_exec.yaml" (
    builtins.toJSON {
      "plugins" = [
        {
          "args" = {
            "files" = [ "${geoLists}/geoip_private.txt" ];
          };
          "tag" = "geoip_private";
          "type" = "ip_set";
        }
        {
          "args" = {
            "files" = [ "${geoLists}/geoip_cn.txt" ];
          };
          "tag" = "geoip_cn";
          "type" = "ip_set";
        }
        {
          "args" = {
            "files" = [
              "${geoLists}/geosite_cn.txt"
              "${whitelist}"
            ];
          };
          "tag" = "geosite_cn";
          "type" = "domain_set";
        }
        {
          "args" = {
            "files" = [
              "${geoLists}/geosite_gfw.txt"
              "${greylist}"
            ];
          };
          "tag" = "geosite_gfw";
          "type" = "domain_set";
        }
        {
          "args" = {
            "files" = [ "${geoLists}/geosite_geolocation-!cn.txt" ];
          };
          "tag" = "geosite_location-!cn";
          "type" = "domain_set";
        }
        {
          "args" = {
            "files" = [ "${geoLists}/geosite_category-ads-all.txt" ];
          };
          "tag" = "geosite_ads-all";
          "type" = "domain_set";
        }
        {
          "args" = {
            "lazy_cache_ttl" = 86400;
            "size" = 8192;
          };
          "tag" = "cache_lan";
          "type" = "cache";
        }
        {
          "args" = {
            "lazy_cache_ttl" = 86400;
            "size" = 131072;
          };
          "tag" = "cache_wan";
          "type" = "cache";
        }
        {
          "args" = {
            "forward" = false;
            "mask4" = 24;
            "mask6" = 48;
            "preset" = "";
            "send" = false;
          };
          "tag" = "no_ecs";
          "type" = "ecs_handler";
        }
        {
          "args" = {
            "forward" = false;
            "mask4" = 24;
            "mask6" = 48;
            "preset" = "114.217.98.237";
            "send" = false;
          };
          "tag" = "ecs_cn";
          "type" = "ecs_handler";
        }
        {
          "args" = [ { "exec" = "ttl 60"; } ];
          "tag" = "ttl_1m";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "ttl 300"; } ];
          "tag" = "ttl_5m";
          "type" = "sequence";
        }
        {
          "args" = [ { "exec" = "ttl 3600"; } ];
          "tag" = "ttl_1h";
          "type" = "sequence";
        }
        {
          "args" = {
            "entries" = [
              "domain:${domain} ${ip.brix}"
              "domain:${duckdns.domain}.duckdns.org ${ip.brix}"
            ];
          };
          "tag" = "selfhost";
          "type" = "hosts";
        }
      ];
    }
  );
  whitelist = pkgs.writeText "whitelist.txt" "";
  greylist = pkgs.writeText "greylist.txt" "";
  # https://www.dolingou.com/article/mosdns-config-with-no-leak
  value = {
    environment = {
      systemPackages = with pkgs; [ mosdns ];
    };
    systemd.services.mosdns = {
      description = "mosdns";
      requires = [ "network-online.target" ];
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      environment._reloadConfig = "${conf}${dat_exec}${dns}${whitelist}${greylist}";
      serviceConfig = rec {
        Type = "simple";
        ExecStart = "${lib.getExe pkgs.mosdns} start -c ${conf}";
        Restart = "always";
        DynamicUser = true;
        StateDirectory = "mosdns";
        WorkingDirectory = "/var/lib/mosdns";
        RuntimeDirectory = "mosdns";
        RuntimeDirectoryMode = "0750";
        ProcSubset = "pid";
        ProtectProc = "invisible";
        UMask = "0027";
        CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
        ProtectHome = true;
        PrivateDevices = true;
        # PrivateUsers = true;
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
        AmbientCapabilities = CapabilityBoundingSet;
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
    networking.firewall = {
      allowedTCPPorts = [ port ];
      allowedUDPPorts = [ port ];
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
      udp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
