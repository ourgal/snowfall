{ lib, ... }:
rec {
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
      containerEnabled = lib.attrsets.filterAttrs (n: v: (n != "enable") && (v.enable == true)) docker;
      ports = lib.attrsets.foldlAttrs (
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

  dockerVolume = vname: pname: nfs: nfsPath: {
    "${vname}" = {
      driver_opts = {
        type = "nfs";
        o = "addr=${nfs},nfsvers=4";
        device = ":${nfsPath}/${pname}_${vname}";
      };
    };
  };

  dockerVolumes =
    vname: pname: nfs: nfsPath:
    if builtins.isList vname then
      builtins.foldl' (acc: v: acc // dockerVolume v pname nfs nfsPath) { } vname
    else if builtins.isString vname then
      dockerVolume vname pname nfs nfsPath
    else
      builtins.throw "not support volume type";

}
