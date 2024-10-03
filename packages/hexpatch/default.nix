{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  cmake,
  python3,
}:

rustPlatform.buildRustPackage rec {
  pname = "hex-patch";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "Etto48";
    repo = "HexPatch";
    rev = "v${version}";
    hash = "sha256-yyYxRJ+o+Z5z7PmjcFCsahRXZ9JHFmGmituzGTxY6ec=";
  };

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
