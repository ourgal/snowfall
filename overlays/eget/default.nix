{ ... }:
_final: prev: {
  eget = prev.eget.overrideAttrs (_oldAttrs: {
    excludedPackages = [
      "test"
      "tools"
    ];
  });
}
