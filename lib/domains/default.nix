{ lib, ... }:
let
  inherit (builtins) foldl';
  domain = "zxc.cn";
  xyzDomain = lib.strings.fileContents ./xyzDomain.key;
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
    "homebox"
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
    "pyload"
    "qd"
    "restic-server"
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
  xyzDomains = (foldl' (acc: v: acc // { "${v}" = "${v}.${xyzDomain}"; }) { } services) // {
    anki-sync-server = "anki.${xyzDomain}";
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
    xyzDomain
    xyzDomains
    ;
}
