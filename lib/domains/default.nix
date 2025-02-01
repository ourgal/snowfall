_:
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
    "jellyfin"
    "kavita"
    "miniflux"
    "navidrome"
    "pairdrop"
    "rustypaste"
    "searx"
    "soft-serve"
    "subconverter"
    "syncthing"
    "transmission"
    "vaultwarden"
    "yacd"
    # keep-sorted end
  ];
  domains = builtins.foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services;
in
{
  inherit domains domain;
}
