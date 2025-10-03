{ ... }:
_final: prev: {
  sfm = prev.sfm.overrideAttrs (_oldAttrs: {
    patches = [
      ./nerdicons-0.4.diff
      ./copypane-0.4.diff
    ];
  });
}
