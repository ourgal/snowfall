{ lib, ... }:
with lib;
{
  webConfig =
    domain: container:
    if container.enable then
      ''
        reverse_proxy http://${domain}:${toString container.port}
      ''
    else
      "";

  # virtualHosts."http://alist.zxc.cn".extraConfig =''
  #   reverse_proxy http://brix.local:${toString config.dot.docker.alist.port}
  # '';
  mkDockerProxy =
    { docker, host }:
    let
      containerEnabled = attrsets.filterAttrs (n: v: (n != "enable") && (v.enable == true)) docker;
      configs = attrsets.foldlAttrs (
        acc: name: value:
        acc
        // {
          "http://${name}.zxc.cn".extraConfig = "reverse_proxy http://${host}:${toString value.port}";
        }
      ) { } containerEnabled;
    in
    {
      enable = true;
      virtualHosts = configs;
    };
}
