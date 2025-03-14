args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkOpt'
    cfgNixos
    switch
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    services.pppd = enabled // {
      peers = {
        edpnet = enabled // {
          # Autostart the PPPoE session on boot
          autostart = true;
          config = ''
            plugin pppoe.so ${cfg.wan}

            # pppd supports multiple ways of entering credentials,
            # this is just 1 way
            name "${lib.strings.fileContents ./name.key}"
            password "${lib.strings.fileContents ./password.key}"

            +ipv6 ipv6cp-use-ipaddr

            persist
            maxfail 0
            holdoff 5

            noipdefault
            defaultroute
          '';
        };
      };
    };
    boot.kernel.sysctl = {
      "net.ipv6.conf.ppp0.accept_ra" = 2;
      "net.ipv6.conf.ppp0.autoconf" = 1;
    };
    networking = {
      interfaces.ppp0.useDHCP = true; # enable dhcpcd on this interface
      dhcpcd = enabled // {
        # Do not remove interface configuration on shutdown.
        persistent = true;
        allowInterfaces = [ "ppp0" ];
        extraConfig = ''
          # don't touch our DNS settings
          nohook resolv.conf

          # generate a RFC 4361 complient DHCP ID
          duid

          # We don't want to expose our hw addr from the router to the internet,
          # so we generate a RFC7217 address.
          slaac private

          # we only want to handle IPv6 with dhcpcd, the IPv4 is still done
          # through pppd daemon
          noipv6rs
          ipv6only

          # settings for the interface
          interface ppp0
            ipv6rs              # router advertisement solicitaion
            iaid 1              # interface association ID
            ia_pd 1 ${cfg.lan}        # request a PD and assign to interface
        '';
      };
    };
    services.corerad = cfg.coread // {
      settings = {
        interfaces = [
          {
            name = "ppp0";
            monitor = false; # see the remark below
          }
          {
            name = cfg.lan;
            advertise = true;
            prefix = [ { prefix = "::/64"; } ];
          }
        ];
      };
    };
  };
  extraOpts = {
    wan = mkOpt' lib.types.str "";
    lan = mkOpt' lib.types.str "";
    coread = switch;
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
