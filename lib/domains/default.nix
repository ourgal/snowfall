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
    # keep-sorted end
  ];
  domains = builtins.foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services;
in
{
  inherit domains domain;
}
