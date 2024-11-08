{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.git-grab) pname version src;

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
