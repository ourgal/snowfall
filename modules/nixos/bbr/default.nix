args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    # Use BBR congestion control
    # https://en.wikipedia.org/wiki/TCP_congestion_control#TCP_BBR
    boot.kernelModules = [ "tcp_bbr" ];
    boot.kernel.sysctl = {
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
