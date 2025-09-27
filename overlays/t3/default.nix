{ ... }:
_final: prev: {
  t3 = prev.t3.overrideAttrs (_oldAttrs: {
    doCheck = false;
  });
}
