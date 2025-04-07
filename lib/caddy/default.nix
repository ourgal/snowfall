{ lib, namespace, ... }:
let
  inherit (lib.attrsets) filterAttrs foldlAttrs;
  inherit (builtins)
    isInt
    isList
    head
    throw
    ;
in
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
      containerEnabled = filterAttrs (n: v: (n != "enable") && v.enable) docker;
      configs = foldlAttrs (
        acc: name: value:
        let
          ports =
            if isInt value.ports then
              value.ports
            else if isList value.ports then
              head value.ports
            else
              throw "not supported port type";
        in
        acc
        // {
          "http://${name}.${lib.${namespace}.domain}".extraConfig =
            "reverse_proxy http://${host}:${toString ports}";
        }
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
      containerEnabled = lib.attrsets.filterAttrs (
        n: v: (n != "enable") && v.enable && v.duckdns.enable
      ) docker;
      configs = lib.attrsets.foldlAttrs (
        acc: name: value:
        let
          ports =
            if isInt value.ports then
              value.ports
            else if isList value.ports then
              head value.ports
            else
              throw "not supported port type";
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

  mkFileServer = domain: path: {
    "http://${domain}".extraConfig = ''
      root    * ${path}
      file_server

      encode zstd gzip
    '';
  };

  mkCaddyProxy = domain: port: {
    virtualHosts = {
      "http://${domain}".extraConfig = ''
        reverse_proxy http://localhost:${toString port}
      '';
    };
  };
}
