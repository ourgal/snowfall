{ lib, ... }:
let
  inherit (builtins) foldl';
  domain = "zxc.cn";
  services = [
    # keep-sorted start
    "alist"
    "anki"
    "ariang"
    "atticd"
    "atuin"
    "calibre-web"
    "cyberchef"
    "dokuwiki"
    "dufs"
    "flaresolverr"
    "gonic"
    "harmonia"
    "immich"
    "jackett"
    "jellyfin"
    "kavita"
    "komga"
    "memos"
    "metacubexd"
    "miniflux"
    "navidrome"
    "nix-serve"
    "pairdrop"
    "qd"
    "rustypaste"
    "scrutiny"
    "searx"
    "soft-serve"
    "sonarr"
    "subconverter"
    "suwayomi-server"
    "syncthing"
    "tiddlywiki"
    "transmission"
    "vaultwarden"
    "yacd"
    "zashboard"
    # keep-sorted end
  ];
  domains = (foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services) // {
    anki-sync-server = "anki.${domain}";
  };
  fakeIpExclude = lib.strings.splitString "\n" (lib.strings.fileContents ./fakeIpExclude.key);
  domainBlackList = lib.strings.splitString "\n" (lib.strings.fileContents ./blacklist.key);
  domainWhiteList = lib.strings.splitString "\n" (lib.strings.fileContents ./whitelist.key);
  redirectDomains = [
    {
      from = "lightnovel.us";
      to = "lightnovel.fun";
    }
  ];
in
{
  inherit
    domains
    domain
    fakeIpExclude
    domainBlackList
    domainWhiteList
    redirectDomains
    ;
}
