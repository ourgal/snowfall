{ lib, namespace, ... }:
{
  mkSshConfig =
    let
      inherit (lib.${namespace}.settings) allHosts;
    in
    builtins.foldl' (
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
