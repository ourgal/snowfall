{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-grab";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  inherit (source) version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-0HZ27rMA2d+roxxl6mYs9vuIWKAXct/6NezuOILs8p0=";

  meta = with lib; {
    description = "Clone a git repository into a standard location organised by domain and path";
    homepage = "https://github.com/wezm/git-grab";
    license = with licenses; [
      asl20
      mit
    ];
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-grab";
  };
}
