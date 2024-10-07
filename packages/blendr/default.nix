{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  dbus,
  libxkbcommon,
  stdenv,
  darwin,
  wayland,
  namespace,
}:
let
  pname = "blendr";
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

  cargoHash = "sha256-2LbHEXLyrWIbWhCzbhB0rS2olBhueTl9cucaz92iYTk=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs =
    [
      dbus
      libxkbcommon
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.AppKit
      darwin.apple_sdk.frameworks.CoreGraphics
      darwin.apple_sdk.frameworks.Foundation
    ]
    ++ lib.optionals stdenv.isLinux [ wayland ];

  meta = with lib; {
    description = "The hacker's BLE (bluetooth low energy) browser terminal app";
    homepage = "https://github.com/dmtrKovalenko/blendr";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "blendr";
  };
}
