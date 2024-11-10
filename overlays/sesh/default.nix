{ ... }:
_final: prev: {
  sesh = prev.sesh.overrideAttrs (_oldAttrs: {
    excludedPackages = [ "docs" ];
  });
}
