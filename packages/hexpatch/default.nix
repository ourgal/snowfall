{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}:

rustPlatform.buildRustPackage rec {
  pname = "hex-patch";
  version = "1.7.4";

  src = fetchFromGitHub {
    owner = "Etto48";
    repo = "HexPatch";
    rev = "v${version}";
    hash = "sha256-i4NWFeNvkj+UKOdC+UkTOlVbJNTk0+Co/4Ev9gpJ+t8=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [ pkg-config ];

  meta = with lib; {
    description = "HexPatch: a binary patcher and editor written in Rust with terminal user interface (TUI";
    homepage = "https://github.com/Etto48/HexPatch";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hex-patch";
  };
}
