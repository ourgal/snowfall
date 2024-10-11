{ channels, lib, ... }:
final: prev: {
  sesh = prev.sesh.overrideAttrs (_oldAttrs: {
    postFixup = "rm $out/bin/docs";
  });
}
