{ ... }:
_final: prev: {
  gat = prev.gat.overrideAttrs (_oldAttrs: {
    excludedPackages = [
      "docs"
      "tapes"
    ];
  });
}
