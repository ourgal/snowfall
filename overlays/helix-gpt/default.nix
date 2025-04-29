{ ... }:
_final: prev: {
  helix-gpt = prev.helix-gpt.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/README.md
    '';
  });
}
