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
          host = e;
          hostname = "${e}.local";
          port = 22;
        };
      }
    ) { } allHosts;
}
