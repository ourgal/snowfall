{ lib, ... }:
with lib;
{
  webConfig =
    domain: container:
    if container.enable then
      ''
        reverse_proxy http://${domain}:${toString container.ports}
      ''
    else
      "";

  # "http://alist.zxc.cn".extraConfig =''
  #   reverse_proxy http://brix.local:${toString config.dot.docker.alist.port}
  # '';
  mkDockerProxy =
    { docker, host }:
    let
      containerEnabled = attrsets.filterAttrs (n: v: (n != "enable") && v.enable) docker;
      configs = attrsets.foldlAttrs (
        acc: name: value:
        let
          ports =
            if builtins.isInt value.ports then
              value.ports
            else if builtins.isList value.ports then
              builtins.head value.ports
            else
              builtins.throw "not supported port type";
        in
        acc // { "http://${name}.zxc.cn".extraConfig = "reverse_proxy http://${host}:${toString ports}"; }
      ) { } containerEnabled;
    in
    configs;

  mkDockerProxyDuckdns =
    {
      docker,
      host,
      domain,
      token,
    }:
    let
      containerEnabled = attrsets.filterAttrs (
        n: v: (n != "enable") && v.enable && v.duckdns.enable
      ) docker;
      configs = attrsets.foldlAttrs (
        acc: name: value:
        let
          ports =
            if builtins.isInt value.ports then
              value.ports
            else if builtins.isList value.ports then
              builtins.head value.ports
            else
              builtins.throw "not supported port type";
        in
        acc
        // {
          "${name}.${domain}.duckdns.org".extraConfig = ''
            tls {
                dns duckdns ${token}
            }
            reverse_proxy http://${host}:${toString ports}'';
        }
      ) { } containerEnabled;
    in
    configs;
}
