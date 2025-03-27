{ namespace, ... }:
let
  inherit (builtins) hasAttr map;
in
{
  mkFishPlugins =
    plugins: pkgs:
    map (
      name:
      if hasAttr name pkgs.${namespace} then
        rec {
          inherit name;
          inherit (pkgs.${namespace}.${name}) src;
        }
      else
        rec {
          inherit name;
          inherit (pkgs.fishPlugins.${name}) src;
        }
    ) plugins;
}
