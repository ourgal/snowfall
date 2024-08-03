{ lib, ... }:
with lib;
{
  dockerPorts =
    host: container:
    let
      toStr = x: y: "${toString x}:${toString y}";
    in
    if builtins.isInt host && builtins.isInt container then
      [ (toStr host container) ]
    else if builtins.isList host && builtins.isList container then
      lib.lists.zipListsWith toStr host container
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
