{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.game_2048_tui) pname version src;

  cargoLock = _sources.game_2048_tui.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "100% Rust. 2048 in `tui`. Build for fun";
    homepage = "https://github.com/WanderHuang/game-2048-tui";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "game-2048-tui";
  };
}
