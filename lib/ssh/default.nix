{ lib, namespace, ... }:
let
  inherit (builtins) foldl';
in
{
  mkSshConfig =
    let
      inherit (lib.${namespace}.settings) allHosts;
    in
    foldl' (
      acc: e:
      acc
      // {
        ${e} = {
          HostName = "${e}.local";
          Port = 22;
        };
      }
    ) { } allHosts;
}
