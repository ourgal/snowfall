_:
let
  inherit (builtins) foldl';
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
    "jackett"
    "jellyfin"
    "kavita"
    "metacubexd"
    "miniflux"
    "navidrome"
    "pairdrop"
    "rustypaste"
    "scrutiny"
    "searx"
    "soft-serve"
    "sonarr"
    "subconverter"
    "syncthing"
    "transmission"
    "vaultwarden"
    "yacd"
    "zashboard"
    "gonic"
    "immich"
    # keep-sorted end
  ];
  domains = foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services;
in
{
  inherit domains domain;
}
