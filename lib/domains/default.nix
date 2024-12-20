{ ... }:
let
  domain = "zxc.cn";
  services = [
    # keep-sorted start
    "alist"
    "anki"
    "ariang"
    "atuin"
    "dufs"
    "flaresolverr"
    "harmonia"
    "kavita"
    "miniflux"
    "pairdrop"
    "rustypaste"
    "searx"
    "soft-serve"
    "syncthing"
    "vaultwarden"
    # keep-sorted end
  ];
  domains = builtins.foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services;
in
{
  inherit domains domain;
}
