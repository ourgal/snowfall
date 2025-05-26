{ ... }:
_final: prev: {
  scooter = prev.scooter.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/bin/xtask
    '';
  });
}
