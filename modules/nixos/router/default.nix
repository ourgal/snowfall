args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace})
    nixosModule
    mkOpt'
    cfgNixos
    lan
    ;
  cfg = cfgNixos config.${namespace} ./.;
  ports = [
    22
    80
    143
    194
    443
    465
    587
    853
    993
    995
    5222
    8080
    8443
  ];
  value = {
    boot.kernel.sysctl = {
      # if you use ipv4, this is all you need
      "net.ipv4.conf.all.forwarding" = true;

      # If you want to use it for ipv6
      "net.ipv6.conf.all.forwarding" = true;

      # source: https://github.com/mdlayher/homelab/blob/master/nixos/routnerr-2/configuration.nix#L52
      # By default, not automatically configure any IPv6 addresses.
      # "net.ipv6.conf.all.accept_ra" = 0;
      # "net.ipv6.conf.all.autoconf" = 0;
      # "net.ipv6.conf.all.use_tempaddr" = 0;

      # On WAN, allow IPv6 autoconfiguration and tempory address use.
      # "net.ipv6.conf.${cfg.wan}.accept_ra" = 2;
      # "net.ipv6.conf.${cfg.wan}.autoconf" = 1;

      # "net.ipv6.conf.all.accept_ra" = 2;
      # "net.ipv6.conf.all.autoconf" = 1;
    };

    networking = {
      useDHCP = false;
      interfaces = {
        # Don't request DHCP on the physical interfaces
        ${cfg.lan} = {
          useDHCP = false;
          ipv4.addresses = [
            {
              address = "${lan}.1";
              prefixLength = 24;
            }
          ];
          ipv6.addresses = [
            {
              address = "fe80:aa:bb:cc::1";
              prefixLength = 64;
            }
            {
              address = "fd5e:4f87:237::1";
              prefixLength = 64;
            }
          ];
        };
        ${cfg.wan}.useDHCP = false;
      };
      firewall = {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
    };
    environment.systemPackages = with pkgs; [ iptables ];
  };
  extraOpts = {
    lan = mkOpt' lib.types.str "";
    wan = mkOpt' lib.types.str "";
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
