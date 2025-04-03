{ lib, ... }:
let
  inherit (builtins)
    isInt
    throw
    isString
    isList
    concatStringsSep
    ;
in
{
  firehol = {
    mkService =
      {
        name,
        tcp ? [ ],
        udp ? [ ],
        tcpRange ? [ ],
        udpRange ? [ ],
      }:
      let
        convertPorts =
          ports:
          if (isInt ports) then
            [ "${toString ports}" ]
          else if (isString ports) then
            [ "${ports}" ]
          else if (isList ports) then
            map toString ports
          else
            throw "not supported type";
        convertPortRange =
          ports:
          if (isList ports) then
            map (v: "${toString v.from}:${toString v.to}") ports
          else
            throw "not supported type";
        serverPorts =
          if (tcp == [ ]) && (udp == [ ] && (tcpRange == [ ]) && (udpRange == [ ])) then
            throw "no port definition"
          else
            concatStringsSep " " (
              lib.optional (tcp != [ ] || tcpRange != [ ]) (
                "tcp/" + concatStringsSep "," (convertPorts tcp ++ convertPortRange tcpRange)
              )

              ++ lib.optional (udp != [ ] || udpRange != [ ]) (
                "udp/" + concatStringsSep "," (convertPorts udp ++ convertPortRange udpRange)
              )
            );
        name' = builtins.replaceStrings [ "-" ] [ "_" ] name;
      in
      ''
        server_${name'}_ports="${serverPorts}"
        client_${name'}_ports="default"
      '';
  };
}
