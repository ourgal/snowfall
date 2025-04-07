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
    "cyberchef"
    "dokuwiki"
    "tiddlywiki"
    "calibre-web"
    "komga"
    "nix-serve"
    # keep-sorted end
  ];
  domains = (foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services) // {
    anki-sync-server = "anki.${domain}";
  };
in
{
  inherit domains domain;
}
