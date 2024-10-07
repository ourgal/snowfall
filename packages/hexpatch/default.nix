{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  cmake,
  python3,
  namespace,
}:
let
  pname = "hexpatch";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
