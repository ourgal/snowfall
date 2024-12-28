{ lib, ... }:
{
  mkNcmpcppBindings =
    bindings:
    lib.attrsets.mapAttrsToList (key: command: {
      inherit key command;
    }) bindings;
}
