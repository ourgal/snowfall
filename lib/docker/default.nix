{ lib, ... }:
with lib;
{
  dockerPorts =
    ports:
    let
      toStr = s: "${toString s}:${toString s}";
    in
    if builtins.isInt ports then
      [ (toStr ports) ]
    else if builtins.isList ports then
      builtins.map (p: toStr p) ports
    else
      "";

  dockerOpenFirewall =
    docker:
    let
      containerEnabled = attrsets.filterAttrs (n: v: (n != "enable") && (v.enable == true)) docker;
      ports = attrsets.foldlAttrs (
        acc: name: value:
        let
          port =
            if builtins.isInt value.ports then
              [ value.ports ]
            else if builtins.isList value.ports && builtins.all builtins.isInt value.ports then
              value.ports
            else
              builtins.throw "not supported port type";
        in
        acc ++ port
      ) [ ] containerEnabled;
    in
    {
      networking.firewall = {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
    };
}
