{ ... }:
_final: prev: {
  helix-gpt = prev.helix-gpt.overrideAttrs (_oldAttrs: {
    postFixup = ''
      rm $out/{README.md,LICENSE}
    '';
  });
}
