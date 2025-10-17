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
    lan6
    switch
    ;
  inherit (builtins) map;
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
          useDHCP = cfg.dhcp.enable;
          ipv4.addresses =
            if cfg.ipv4 == [ ] then
              if cfg.dhcp.enable then
                [ ]
              else
                [
                  {
                    address = "${lan}.1";
                    prefixLength = 24;
                  }
                ]
            else
              map (v: {
                address = v;
                prefixLength = 24;
              }) cfg.ipv4;
          ipv6.addresses =
            if cfg.ipv6 == [ ] then
              if cfg.dhcp.enable then
                [ ]
              else
                map (v: {
                  address = "${v}::1";
                  prefixLength = 64;
                }) lan6
            else
              map (v: {
                address = "${v}::1";
                prefixLength = 64;
              }) cfg.ipv6;
        };
      }
      // (if cfg.wan != "" then { ${cfg.wan}.useDHCP = false; } else { });
      firewall = {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
    };
    environment.systemPackages = with pkgs; [ iptables ];
  };
  extraOpts =
    let
      inherit (lib.types) str listOf;
    in
    {
      lan = mkOpt' str "";
      wan = mkOpt' str "";
      ipv4 = mkOpt' (listOf str) [ ];
      ipv6 = mkOpt' (listOf str) [ ];
      dhcp = switch;
    };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
