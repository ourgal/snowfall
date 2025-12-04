{ ... }:
_final: prev: {
  git-toolbelt = prev.git-toolbelt.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/bin/{git-wip,git-local-commits,git-root}
    '';
  });
}
