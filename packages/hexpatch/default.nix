{
  lib,
  rustPlatform,
  pkg-config,
  cmake,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "hexpatch";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-6IaSKVPEen4aI977rv8jv/M8FCe7ABr7qSHgisWieVM=";

  nativeBuildInputs = [
    pkg-config
    cmake
    python3
  ];

  meta = with lib; {
    description = "HexPatch: a binary patcher and editor written in Rust with terminal user interface (TUI";
    homepage = "https://github.com/Etto48/HexPatch";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hex-patch";
  };
}
