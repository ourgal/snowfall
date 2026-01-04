{ ... }:
_final: prev: {
  git-extras = prev.git-extras.overrideAttrs (_oldAttrs: {
    postFixup = ''
      rm $out/bin/git-undo
    '';
  });
}
