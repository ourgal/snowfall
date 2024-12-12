{ ... }:
let
  domain = "zxc.cn";
  services = [
    "searx"
    "anki"
    "vaultwarden"
    "kavita"
    "miniflux"
    "rustypaste"
    "pairdrop"
    "dufs"
    "ariang"
    "syncthing"
    "atuin"
    "harmonia"
  ];
  domains = builtins.foldl' (acc: v: acc // { "${v}" = "${v}.${domain}"; }) { } services;
in
{
  inherit domains;
}
