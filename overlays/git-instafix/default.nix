{ ... }:
_final: prev: {
  git-instafix = prev.git-instafix.overrideAttrs (_oldAttrs: {
    doCheck = false;
  });
}
