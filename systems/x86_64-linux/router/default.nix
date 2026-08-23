{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled disabled getDirname;
  name = getDirname ./.;
in
{
  imports = [ ./facter.nix ];

  dot =
    let
      lan = "enp2s0";
      wan = "enp3s0";
    in
    {
      user.host = name;
      boot.grub.normal = enabled;
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
        dhcp = enabled;
      };
      firewall = {
        disable = enabled;
      };
      avahi = enabled;
      pppd = enabled // {
        inherit wan lan;
      };
      sing-box = enabled;
      mihomo = disabled;
      sops-nix = enabled // {
        router = enabled;
        ssh = enabled;
        cloudflared = enabled;
        tailscale = disabled;
      };
      bpftune = enabled;
      iotop = enabled;
      harmonia = enabled;
      cloudflared = enabled;
      tailscale = disabled;
      bbr = enabled;
      pixiecore = enabled;
    };

  system.stateVersion = "24.11";
}
