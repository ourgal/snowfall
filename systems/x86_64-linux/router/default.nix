{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled;
  user = config.${namespace}.user.name;
in
{

  dot =
    let
      lan = "enp2s0";
      wan = "enp3s0";
    in
    {
      user.host = "router";
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
    };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.11";
}
