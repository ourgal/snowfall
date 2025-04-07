{ lib, ... }:
{
  freeSubs =
    let
      prefix = "https://fastly.jsdelivr.net/gh";
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
    in
    filter {
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
      free18 = {
        name = "free18";
        url = mkUrl {
          user = "free18";
          repo = "v2ray";
          branch = "master";
          path = "v.txt";
        };
        inherit updateInterval;
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
    };
}
