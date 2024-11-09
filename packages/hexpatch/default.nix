{
  lib,
  rustPlatform,
  pkg-config,
  cmake,
  python3,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.hexpatch) pname version src;

  cargoHash = "sha256-jWDntqxWsSzfDFxZnVDxh7n/CjFIj+sYMsyX/UXhoaM=";

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
