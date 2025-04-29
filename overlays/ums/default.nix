{ ... }:
_final: prev: {
  ums = prev.ums.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/README.md
    '';
  });
}
