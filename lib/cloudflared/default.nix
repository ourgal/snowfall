{ lib, ... }:
{
  cloudflaredTunnelID = lib.strings.fileContents ./id.key;
}
