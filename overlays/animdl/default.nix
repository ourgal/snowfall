{ ... }:
_final: prev: {
  animdl = prev.animdl.overrideAttrs (_oldAttrs: {
    pythonRelaxDeps = _oldAttrs.pythonRelaxDeps ++ [ "cssselect" ];
  });
}
