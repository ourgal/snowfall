{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "game_2048_tui";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-eTld+ryAE9hpnsTtoYXkZJIQ8O4fnk3lPMUfLvJVruQ=";

  meta = with lib; {
    description = "100% Rust. 2048 in `tui`. Build for fun";
    homepage = "https://github.com/WanderHuang/game-2048-tui";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "game-2048-tui";
  };
}
