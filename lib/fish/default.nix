{ namespace, ... }:
{
  mkFishPlugins =
    plugins: pkgs:
    builtins.map (
      name:
      if builtins.hasAttr name pkgs.${namespace} then
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
