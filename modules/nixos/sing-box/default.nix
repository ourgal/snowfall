args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  apiPort = 9999;
  mixPort = 7890;
  package = pkgs.sing-box;
  sing-box-subscribe-cli-config = {
    log = {
      disabled = false;
      level = "error";
      timestamp = true;
    };
    experimental = {
      clash_api = {
        external_controller = "0.0.0.0:${toString apiPort}";
        external_ui = pkgs.metacubexd;
        external_ui_download_url = "https://gh-proxy.org/https://github.com/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.zip";
        external_ui_download_detour = "🐢Direct";
        secret = "";
        default_mode = "rule";
        access_control_allow_origin = "*";
        access_control_allow_private_network = false;
      };
      cache_file = {
        enabled = true;
        store_fakeip = true;
        store_rdrc = true;
      };
    };
    dns = {
      servers = [
        {
          tag = "ProxyDNS";
          type = "https";
          server = "dns.google";
          domain_resolver = "AliDNS";
          detour = "🚀FinalOut";
        }
        {
          tag = "DirectDNS";
          type = "https";
          server = "dns.alidns.com";
          domain_resolver = "AliDNS";
        }
        {
          tag = "AliDNS";
          type = "udp";
          server = "223.5.5.5";
        }
        {
          tag = "local";
          type = "local";
        }
        {
          tag = "FakeIP";
          type = "fakeip";
          inet4_range = "198.18.0.0/15";
          inet6_range = "fc00::/18";
        }
      ];
      rules = [
        {
          clash_mode = "direct";
          server = "DirectDNS";
        }
        {
          clash_mode = "global";
          server = "ProxyDNS";
        }
        {
          query_type = [
            "A"
            "AAAA"
          ];
          server = "FakeIP";
        }
        {
          rule_set = [ "geosite-category-ads-all" ];
          server = "DirectDNS";
          action = "reject";
          method = "default";
          no_drop = false;
        }
        {
          rule_set = [ "geosite-category-games@cn" ];
          server = "DirectDNS";
        }
        {
          rule_set = [ "geosite-geolocation-!cn" ];
          server = "ProxyDNS";
        }
        {
          rule_set = [ "geosite-cn" ];
          server = "DirectDNS";
        }
      ];
      final = "local";
      strategy = "prefer_ipv4";
      disable_cache = false;
      disable_expire = false;
      independent_cache = true;
      reverse_mapping = false;
    };
    inbounds = [
      {
        type = "tun";
        tag = "tun-in";
        address = [
          "172.18.0.1/30"
          "fdfe:dcba:9876::1/126"
        ];
        auto_route = true;
        auto_redirect = true;
        strict_route = true;
        endpoint_independent_nat = false;
        stack = "system";
        exclude_package = [ "com.android.captiveportallogin" ];
      }
      {
        type = "mixed";
        tag = "mixed-in";
        listen = "::";
        listen_port = mixPort;
      }
    ];
    outbounds = [
      {
        tag = "🚀FinalOut";
        type = "selector";
        outbounds = [
          "🌏日韩台新"
          "📌单选节点"
          "🇭🇰香港节点"
          "🇯🇵日本节点"
          "🇰🇷韩国节点"
          "🇹🇼台湾节点"
          "🇸🇬新加坡节点"
          "🇺🇸美国节点"
        ];
        interrupt_exist_connections = true;
      }
      {
        tag = "🌏日韩台新";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇯🇵|日本|JP|Japan|🇰🇷|韩国|KR|South Korea|🇹🇼|台湾|TW|Taiwan|🇸🇬|新加坡|SG|Singapore" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "📌单选节点";
        type = "selector";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "exclude";
            keywords = [ "剩余|流量|raffic|有效|时间|到期|xpire|地址|网址|官网|自动|最优|最快" ];
          }
        ];
        interrupt_exist_connections = true;
      }
      {
        tag = "🇭🇰香港节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇭🇰|香港|HK|Hong Kong" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🇯🇵日本节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇯🇵|日本|JP|Japan" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🇰🇷韩国节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇰🇷|韩国|KR|South Korea" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🇹🇼台湾节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇹🇼|台湾|TW|Taiwan" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🇸🇬新加坡节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇸🇬|新加坡|SG|Singapore" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🇺🇸美国节点";
        type = "urltest";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇺🇸|美国|US|USA|United States" ];
          }
        ];
        url = "https://www.gstatic.com/generate_204";
        interval = "10m";
        tolerance = 10;
        interrupt_exist_connections = true;
      }
      {
        tag = "🐢Direct";
        type = "direct";
      }
    ];
    route = {
      default_domain_resolver = {
        server = "DirectDNS";
      };
      auto_detect_interface = true;
      final = "🚀FinalOut";
      rules = [
        {
          inbound = [
            "mixed-in"
            "tun-in"
          ];
          action = "sniff";
        }
        {
          type = "logical";
          mode = "or";
          rules = [
            { protocol = "dns"; }
            { port = 53; }
          ];
          action = "hijack-dns";
        }
        {
          rule_set = [ "geosite-private" ];
          outbound = "🐢Direct";
        }
        {
          ip_is_private = true;
          outbound = "🐢Direct";
        }
        {
          clash_mode = "direct";
          outbound = "🐢Direct";
        }
        {
          clash_mode = "global";
          outbound = "🚀FinalOut";
        }
        {
          type = "logical";
          mode = "or";
          rules = [
            { port = 853; }
            {
              network = "udp";
              port = 443;
            }
            { protocol = "stun"; }
          ];
          action = "reject";
        }
        {
          rule_set = [ "geosite-category-ads-all" ];
          action = "reject";
        }
        {
          protocol = "bittorrent";
          outbound = "🐢Direct";
        }
        {
          rule_set = [ "geosite-category-games@cn" ];
          outbound = "🐢Direct";
        }
        {
          rule_set = [ "geosite-geolocation-!cn" ];
          outbound = "🚀FinalOut";
        }
        {
          rule_set = [ "geosite-cn" ];
          outbound = "🐢Direct";
        }
        {
          rule_set = [ "geoip-cn" ];
          outbound = "🐢Direct";
        }
      ];
      rule_set = [
        {
          tag = "geosite-private";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/private.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
        {
          tag = "geosite-category-ads-all";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/category-ads-all.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
        {
          tag = "geosite-category-games@cn";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/category-games@cn.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
        {
          tag = "geosite-geolocation-!cn";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/geolocation-!cn.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
        {
          tag = "geosite-cn";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/cn.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
        {
          tag = "geoip-cn";
          type = "remote";
          format = "binary";
          url = "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geoip/cn.srs";
          download_detour = "🐢Direct";
          update_interval = "3d";
        }
      ];
    };
  };
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
            template = pkgs.writeText "template.json" (builtins.toJSON sing-box-subscribe-cli-config);
            script = pkgs.writeShellScript "sing-box-pre-start" ''
              ${
                lib.getExe pkgs.${namespace}.sing-box-subscribe-cli
              } --template ${template} --out /run/sing-box/config.json ${lib.strings.fileContents ./nano.key}
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
