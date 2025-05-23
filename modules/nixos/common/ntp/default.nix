args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.timeServers = [
      "ntp.aliyun.com" # Aliyun
      "ntp.tencent.com" # Tencent Cloud
      "time.izatcloud.net" # Qualcomm NTP Server
      "time.gpsonextra.net"
      "hik-time.ys7.com" # hikvision
      "time.ys7.com"
      "cn.pool.ntp.org" # Pool NTP ORG
      "cn.ntp.org.cn" # NTP ORG CN
      "ntp.ntsc.ac.cn" # NTSC NTP Server
    ];
  };
  enable = "timesyncd";
  _args = { inherit value args enable; };
in
nixosModule _args
