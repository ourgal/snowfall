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
      user.host = "d2550";
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
      pppd = enabled // {
        inherit wan lan;
      };
      sing-box = disabled;
      mihomo = enabled;
      temp-hosts = enabled;
      sops-nix = enabled // {
        router = enabled;
        ssh = enabled;
      };
      bpftune = enabled;
    };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.11";
}
