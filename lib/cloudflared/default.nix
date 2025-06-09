{ lib, ... }:
let
  inherit (lib.strings) fileContents;
  inherit (builtins) fromTOML;
in
{
  cloudflaredTunnelID = fromTOML (fileContents ./id.key);
}
