{ ... }:
_final: prev: {
  ums = prev.ums.overrideAttrs (_oldAttrs: {
    postFixup = ''
      rm $out/README.md
    '';
  });
}
