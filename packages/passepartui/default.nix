{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  stdenv,
  darwin,
  wayland,
}:

rustPlatform.buildRustPackage rec {
  pname = "passepartui";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "kardwen";
    repo = "passepartui";
    rev = "v${version}";
    hash = "sha256-4MXD+5gpfWHIioF3doUnpV0aGQI2VqYfgrBpmUn2R7Y=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [ pkg-config ];

  buildInputs =
    lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.AppKit
      darwin.apple_sdk.frameworks.CoreGraphics
    ]
    ++ lib.optionals stdenv.isLinux [ wayland ];

  doCheck = false;

  meta = with lib; {
    description = "A TUI for pass";
    homepage = "https://github.com/kardwen/passepartui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "passepartui";
  };
}
