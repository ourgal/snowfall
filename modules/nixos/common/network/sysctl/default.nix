args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.kernel.sysctl = {
      # Enable broadcast echo Protection
      "net.ipv4.icmp_echo_ignore_broadcasts" = true;

      # Disable Source Routed Packets
      "net.ipv4.conf.all.accept_source_route" = false;
      "net.ipv4.conf.default.accept_source_route" = false;

      # Enable TCP SYN Cookie Protection
      "net.ipv4.tcp_syncookies" = true;

      # Disable ICMP Redirect Acceptance
      "net.ipv4.conf.all.accept_redirects" = false;
      "net.ipv4.conf.default.accept_redirects" = false;

      # Don't send Redirect Messages
      "net.ipv4.conf.all.send_redirects" = false;
      "net.ipv4.conf.default.send_redirects" = false;

      # Drop Spoofed Packets comming in on an interface, which if replied to would result in the reply going out a different interface.
      "net.ipv4.conf.all.rp_filter" = true;
      "net.ipv4.conf.default.rp_filter" = true;

      # Log packets with impossiable addresses.
      "net.ipv4.conf.all.log_martians" = false;
      "net.ipv4.conf.default.log_martians" = false;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
