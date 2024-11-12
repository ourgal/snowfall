{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.git-grab) pname version src;

  cargoLock = _sources.git-grab.cargoLock."Cargo.lock";

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
