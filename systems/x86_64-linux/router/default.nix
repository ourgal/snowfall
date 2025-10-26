{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled disabled getDirname;
  name = getDirname ./.;
in
{

  dot =
    let
      lan = "enp2s0";
      wan = "enp3s0";
    in
    {
      user.host = name;
      boot.grub = enabled;
      common = enabled;
      nh = enabled;
      disko = enabled;
      tuptime = enabled;
      router = enabled // {
        inherit wan lan;
      };
      dnsmasq = enabled // {
        inherit lan;
        dns = enabled;
        dhcp = enabled // {
          only = true;
        };
      };
      avahi = enabled;
      pppd = enabled // {
        inherit wan lan;
      };
      sing-box = enabled;
      mihomo = disabled;
      temp-hosts = enabled;
      sops-nix = enabled // {
        router = enabled;
        ssh = enabled;
        cloudflared = enabled;
        tailscale = enabled;
      };
      bpftune = enabled;
      iotop = enabled;
      harmonia = enabled;
      cloudflared = enabled;
      tailscale = enabled;
      bbr = enabled;
    };

  system.stateVersion = "24.11";
}
