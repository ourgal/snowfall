{ lib, ... }:
with lib;
{
  dockerPots =
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
            if builtins.isInt value.port then
              [ value.port ]
            else if builtins.isList value.port && builtins.all builtins.isInt value.port then
              value.port
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
