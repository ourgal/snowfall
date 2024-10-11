{ channels, lib, ... }:
final: prev: {
  gat = prev.gat.overrideAttrs (_oldAttrs: {
    postFixup = "rm $out/bin/docs";
  });
}
