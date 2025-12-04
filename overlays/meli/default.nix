{ ... }:
_final: prev: {
  meli = prev.meli.overrideAttrs (_oldAttrs: {
    doCheck = false;
  });
}
