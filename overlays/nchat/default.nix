{ channels, ... }:
final: prev: {
  nchat = prev.nchat.overrideAttrs (_oldAttrs: rec {
    version = "4.50";
    src = prev.fetchFromGitHub {
      owner = "d99kris";
      repo = "nchat";
      rev = "v${version}";
      hash = "sha256-o7xEXp+YAXl2/N7bAWT1hyKWCrhT/zi0k1ij0xDY6VM=";
    };
  });
}
