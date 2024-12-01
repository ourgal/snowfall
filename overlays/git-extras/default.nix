{ ... }:
_final: prev: {
  git-extras = prev.git-extras.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/bin/git-undo
    '';
  });
}
