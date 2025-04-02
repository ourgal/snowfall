{ lib, ... }:
{
  freeSubs =
    let
      prefix = "https://proxy.v2gh.com/https://raw.githubusercontent.com";
    in
    lib.attrsets.filterAttrs (_: v: (v.broken == false) && (v.enable == true)) {
      free-servers = {
        name = "free-servers";
        url = "${prefix}/Pawdroid/Free-servers/main/sub";
        updateInterval = 4;
        broken = false;
        enable = false;
      };
      free-vless = {
        name = "free-vless";
        url = "${prefix}/barry-far/V2ray-Configs/main/Splitted-By-Protocol/vless.txt";
        updateInterval = 4;
        broken = false;
        enable = true;
      };
      awesome-vpn = {
        name = "awesome-vpn";
        url = "${prefix}/awesome-vpn/awesome-vpn/master/all";
        updateInterval = 4;
        broken = false;
        enable = false;
      };
      free18 = {
        name = "free18";
        url = "${prefix}/free18/v2ray/main/v.txt";
        updateInterval = 4;
        broken = false;
        enable = false;
      };
      yudou66 = {
        name = "yudou66";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/yudou66.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      clashmeta = {
        name = "clashmeta";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/clashmeta.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      ndnode = {
        name = "ndnode";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/ndnode.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      nodev2ray = {
        name = "nodev2ray";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/nodev2ray.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      nodefree = {
        name = "nodefree";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/nodefree.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      v2rayshare = {
        name = "v2rayshare";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/v2rayshare.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      wenode = {
        name = "wenode";
        url = "${prefix}/Barabama/FreeNodes/main/nodes/wenode.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      openproxylist = {
        name = "openproxylist";
        url = "${prefix}/roosterkid/openproxylist/main/V2RAY_BASE64.txt";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      V2RayAggregator_public = {
        name = "V2RayAggregator_public";
        url = "${prefix}/mahdibland/ShadowsocksAggregator/master/Eternity";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      V2RayAggregator_airports = {
        name = "V2RayAggregator_airports";
        url = "${prefix}/mahdibland/ShadowsocksAggregator/master/EternityAir";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
      ".proxy" = {
        name = ".prorxy";
        url = "${prefix}/mheidari98/.proxy/main/vless";
        updateInterval = 6;
        broken = false;
        enable = false;
      };
    };
}
