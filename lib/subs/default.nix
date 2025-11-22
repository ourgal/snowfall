{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) domains;
  inherit (builtins) isBool throw;
in
{
  subsExcludes = "中国";
  freeSubs =
    {
      isMihomo ? false,
    }:
    let
      mkSubUrl =
        {
          raw ? "",
          user ? "",
          repo ? "",
          branch ? "",
          path ? "",
          converter ? "sublink",
        }:
        let
          cdn = "https://fastly.jsdelivr.net/gh";
          subconverter = "http://${domains.subconverter}/sub?target=${
            if isMihomo then "clash" else "singbox"
          }&config=config/ACL4SSR_Mini.ini&url=";
          sublink = "https://${domains.sublink}/${
            if isMihomo then "clash" else "singbox"
          }?&ua=&selectedRules=[]&customRules=[]&config=";
        in
        if converter == "subconverter" then
          let
            prefix = subconverter + cdn;
          in
          if raw != "" then "${subconverter}${raw}" else "${prefix}/${user}/${repo}@${branch}/${path}"
        else if converter == "sublink" then
          let
            prefix = sublink + cdn;
          in
          if raw != "" then "${sublink}${raw}" else "${prefix}/${user}/${repo}@${branch}/${path}"
        else
          throw "unknown mkSubUrl converter type";
      filter = lib.attrsets.filterAttrs (
        _: v:
        let
          notHaveBroken = !(v ? broken);
          brokenIsBool = isBool v.broken;
          notBroken = v.broken == false;
          haveEnable = v ? enable;
          enableIsBool = isBool v.enable;
          enabled = v.enable == true;
        in
        (notHaveBroken || (brokenIsBool && notBroken)) && (haveEnable && enableIsBool && enabled)
      );
      updateInterval = 6;
      mihomoSupport = {
        free-trojan = {
          name = "free-trojan";
          url = mkSubUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/trojan.txt";
          };
          inherit updateInterval;
        };
        free-vmess = {
          name = "free-vmess";
          url = mkSubUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/vmess.txt";
          };
          inherit updateInterval;
        };
        openproxylist = {
          name = "openproxylist";
          url = mkSubUrl {
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
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/yudou66.txt";
          };
          inherit updateInterval;
        };
        clashmeta = {
          name = "clashmeta";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/clashmeta.txt";
          };
          inherit updateInterval;
        };
        ndnode = {
          name = "ndnode";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/ndnode.txt";
          };
          inherit updateInterval;
        };
        nodev2ray = {
          name = "nodev2ray";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/nodev2ray.txt";
          };
          inherit updateInterval;
        };
        nodefree = {
          name = "nodefree";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/nodefree.txt";
          };
          inherit updateInterval;
        };
        v2rayshare = {
          name = "v2rayshare";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/v2rayshare.txt";
          };
          inherit updateInterval;
        };
        wenode = {
          name = "wenode";
          url = mkSubUrl {
            user = "Barabama";
            repo = "FreeNodes";
            branch = "main";
            path = "nodes/wenode.txt";
          };
          inherit updateInterval;
        };
        V2RayAggregator_public = {
          name = "V2RayAggregator_public";
          url = mkSubUrl {
            user = "mahdibland";
            repo = "ShadowsocksAggregator";
            branch = "master";
            path = "Eternity";
          };
          inherit updateInterval;
        };
        free18 = {
          name = "free18";
          url = mkSubUrl {
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
          url = mkSubUrl {
            user = "Pawdroid";
            repo = "Free-servers";
            branch = "main";
            path = "sub";
          };
          inherit updateInterval;
        };
        free-vless = {
          name = "free-vless";
          url = mkSubUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/vless.txt";
          };
          inherit updateInterval;
        };
        free-ss = {
          name = "free-ss";
          url = mkSubUrl {
            user = "barry-far";
            repo = "V2ray-Configs";
            branch = "main";
            path = "Splitted-By-Protocol/ss.txt";
          };
          inherit updateInterval;
        };
        awesome-vpn = {
          name = "awesome-vpn";
          url = mkSubUrl {
            user = "awesome-vpn";
            repo = "awesome-vpn";
            branch = "master";
            path = "all";
          };
          inherit updateInterval;
        };
        V2RayAggregator_airports = {
          name = "V2RayAggregator_airports";
          url = mkSubUrl {
            user = "mahdibland";
            repo = "ShadowsocksAggregator";
            branch = "master";
            path = "EternityAir";
          };
          inherit updateInterval;
        };
        ".proxy" = {
          name = ".prorxy";
          url = mkSubUrl {
            user = "mheidari98";
            repo = ".proxy";
            branch = "main";
            path = "vless";
          };
          inherit updateInterval;
        };
        xray-proxy-grabber-telegram = {
          name = "xray-proxy-grabber-telegram";
          url = mkSubUrl {
            user = "MrMohebi";
            repo = "xray-proxy-grabber-telegram";
            branch = "master";
            path = "collected-proxies/row-url/all.txt";
          };
          inherit updateInterval;
        };
        node = {
          name = "node";
          url = mkSubUrl {
            user = "Vauth";
            repo = "node";
            branch = "main";
            path = "Main";
          };
          inherit updateInterval;
        };
        proxy-minging = {
          name = "proxy-minging";
          url = mkSubUrl {
            user = "yitong2333";
            repo = "proxy-minging";
            branch = "main";
            path = "v2ray.txt";
          };
          inherit updateInterval;
        };
        V2rayCollector_Py = {
          name = "V2rayCollector_Py";
          url = mkSubUrl {
            user = "MhdiTaheri";
            repo = "V2rayCollector_Py";
            branch = "main";
            path = "sub/Mix/mix.txt";
          };
          inherit updateInterval;
        };
        Proxy-sorter = {
          name = "Proxy-sorter";
          url = mkSubUrl {
            user = "Surfboardv2ray";
            repo = "Proxy-sorter";
            branch = "main";
            path = "submerge/converted.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_vless = {
          name = "free-proxy-list_vless";
          url = mkSubUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/vless.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_vmess = {
          name = "free-proxy-list_vmess";
          url = mkSubUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/vmess.txt";
          };
          inherit updateInterval;
        };
        free-proxy-list_trojan = {
          name = "free-proxy-list_trojan";
          url = mkSubUrl {
            user = "gfpcom";
            repo = "free-proxy-list";
            branch = "main";
            path = "list/trojan.txt";
          };
          inherit updateInterval;
        };
        TGParse = {
          name = "TGParse";
          url = mkSubUrl {
            user = "Surfboardv2ray";
            repo = "TGParse";
            branch = "main";
            path = "splitted/mixed";
          };
          inherit updateInterval;
        };
        Mineral = {
          name = "Mineral";
          url = mkSubUrl {
            user = "LalatinaHub";
            repo = "Mineral";
            branch = "master";
            path = "result/nodes";
          };
          inherit updateInterval;
        };
        SCP1 = {
          name = "SCP1";
          url = mkSubUrl { raw = "https://bh.jiedianxielou.workers.dev/"; };
          inherit updateInterval;
        };
        aniu-snippets = {
          name = "aniu-snippets";
          url = mkSubUrl { raw = "https://h.x9527x.top/sub?token=X"; };
          inherit updateInterval;
          enable = true;
        };
        worker2 = {
          name = "worker2";
          url = mkSubUrl { raw = "https://misub.yifang.ggff.net/yifang/yifang1"; };
          inherit updateInterval;
          enable = true;
        };
        kejiland = {
          name = "kejiland";
          url = mkSubUrl { raw = "https://sub.hkvip.ip-ddns.com/kejiland"; };
          inherit updateInterval;
        };
        danfeng = {
          name = "danfeng";
          url = mkSubUrl {
            raw = "https://sub.danfeng.eu.org/sub?uuid=b5544203-55e3-426e-92f1-0684c93f9829&host=snippet.danfeng.site";
          };
          inherit updateInterval;
        };
        aniu-hk = {
          name = "aniu-hk";
          url = mkSubUrl { raw = "https://hk.xmm1993.top/sub?token=X"; };
          inherit updateInterval;
          enable = true;
        };
      }
    );
}
