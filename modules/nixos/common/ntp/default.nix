args:
let
  inherit (args) namespace lib config;
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
    services.timesyncd.servers = config.networking.timeServers;
  };
  _args = { inherit value args; };
in
nixosModule _args
