{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) domains;
in
{
  subsExcludes = "中国";
  freeSubs =
    {
      isMihomo ? false,
    }:
    let
      subconverter = "http://${domains.subconverter}/sub?target=${
        if isMihomo then "clash" else "singbox"
      }&config=config/ACL4SSR_Mini.ini&url=";
      cdn = "https://fastly.jsdelivr.net/gh";
      prefix = subconverter + cdn;
      mkUrl =
        {
          user,
          repo,
          branch,
          path,
        }:
        "${prefix}/${user}/${repo}@${branch}/${path}";
      filter = lib.attrsets.filterAttrs (
        _: v: (!(v ? broken) || v.broken == false) && (v ? enable && v.enable == true)
      );
      updateInterval = 6;
      mihomoSupport = {
        free-trojan = {
          name = "free-trojan";
          url = mkUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/trojan.txt";
          };
          inherit updateInterval;
        };
        free-vmess = {
          name = "free-vmess";
          url = mkUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/vmess.txt";
          };
          inherit updateInterval;
        };
        openproxylist = {
          name = "openproxylist";
          url = mkUrl {
            user = "roosterkid";
            repo = "openproxylist";
            branch = "main";
            path = "V2RAY_BASE64.txt";
          };
          inherit updateInterval;
          enable = true;
        };
        yudou66 = {
          name = "yudou66";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/yudou66.txt";
          };
          inherit updateInterval;
        };
        clashmeta = {
          name = "clashmeta";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/clashmeta.txt";
          };
          inherit updateInterval;
        };
        ndnode = {
          name = "ndnode";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/ndnode.txt";
          };
          inherit updateInterval;
        };
        nodev2ray = {
          name = "nodev2ray";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/nodev2ray.txt";
          };
          inherit updateInterval;
        };
        nodefree = {
          name = "nodefree";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/nodefree.txt";
          };
          inherit updateInterval;
        };
        v2rayshare = {
          name = "v2rayshare";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/v2rayshare.txt";
          };
          inherit updateInterval;
        };
        wenode = {
          name = "wenode";
          url = mkUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/wenode.txt";
          };
          inherit updateInterval;
        };
        V2RayAggregator_public = {
          name = "V2RayAggregator_public";
          url = mkUrl {
            user = "mahdibland";
            repo = "ShadowsocksAggregator";
            branch = "master";
            path = "Eternity";
          };
          inherit updateInterval;
        };
        free18 = {
          name = "free18";
          url = mkUrl {
            user = "free18";
            repo = "v2ray";
            branch = "master";
            path = "v.txt";
          };
          inherit updateInterval;
          enable = true;
        };
      };
    in
    filter (
      mihomoSupport
      // {
        free-servers = {
          name = "free-servers";
          url = mkUrl {
            user = "Pawdroid";
            repo = "Free-servers";
            branch = "main";
            path = "sub";
          };
          inherit updateInterval;
        };
        free-vless = {
          name = "free-vless";
          url = mkUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/vless.txt";
          };
          inherit updateInterval;
        };
        free-ss = {
          name = "free-ss";
          url = mkUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/ss.txt";
          };
          inherit updateInterval;
        };
        awesome-vpn = {
          name = "awesome-vpn";
          url = mkUrl {
            user = "awesome-vpn";
            repo = "awesome-vpn";
            branch = "master";
            path = "all";
          };
          inherit updateInterval;
        };
        V2RayAggregator_airports = {
          name = "V2RayAggregator_airports";
          url = mkUrl {
            user = "mahdibland";
            repo = "ShadowsocksAggregator";
            branch = "master";
            path = "EternityAir";
          };
          inherit updateInterval;
        };
        ".proxy" = {
          name = ".prorxy";
          url = mkUrl {
            user = "mheidari98";
            repo = ".proxy";
            branch = "main";
            path = "vless";
          };
          inherit updateInterval;
        };
        xray-proxy-grabber-telegram = {
          name = "xray-proxy-grabber-telegram";
          url = mkUrl {
            user = "MrMohebi";
            repo = "xray-proxy-grabber-telegram";
            branch = "master";
            path = "collected-proxies/row-url/all.txt";
          };
          inherit updateInterval;
        };
        node = {
          name = "node";
          url = mkUrl {
            user = "Vauth";
            repo = "node";
            branch = "main";
            path = "Main";
          };
          inherit updateInterval;
        };
        proxy-minging = {
          name = "proxy-minging";
          url = mkUrl {
            user = "yitong2333";
            repo = "proxy-minging";
            branch = "main";
            path = "v2ray.txt";
          };
          inherit updateInterval;
        };
        V2rayCollector_Py = {
          name = "V2rayCollector_Py";
          url = mkUrl {
            user = "MhdiTaheri";
            repo = "V2rayCollector_Py";
            branch = "main";
            path = "sub/Mix/mix.txt";
          };
          inherit updateInterval;
        };
        Proxy-sorter = {
          name = "Proxy-sorter";
          url = mkUrl {
            user = "Surfboardv2ray";
            repo = "Proxy-sorter";
            branch = "main";
            path = "submerge/converted.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_vless = {
          name = "free-proxy-list_vless";
          url = mkUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/vless.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_vmess = {
          name = "free-proxy-list_vmess";
          url = mkUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/vmess.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_trojan = {
          name = "free-proxy-list_trojan";
          url = mkUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/trojan.txt";
          };
          inherit updateInterval;
        };
        TGParse = {
          name = "TGParse";
          url = mkUrl {
            user = "Surfboardv2ray";
            repo = "TGParse";
            branch = "main";
            path = "splitted/mixed";
          };
          inherit updateInterval;
        };
        Mineral = {
          name = "Mineral";
          url = mkUrl {
            user = "LalatinaHub";
            repo = "Mineral";
            branch = "master";
            path = "result/nodes";
          };
          inherit updateInterval;
        };
      }
    );
}
