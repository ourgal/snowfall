{ lib, ... }:
{
  mkAliaeAlias =
    aliases:
    lib.attrsets.mapAttrsToList (name: value: {
      inherit name value;
    }) aliases;
}
