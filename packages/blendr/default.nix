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
}:

rustPlatform.buildRustPackage rec {
  pname = "blendr";
  version = "1.3.3";

  src = fetchFromGitHub {
    owner = "dmtrKovalenko";
    repo = "blendr";
    rev = "v${version}";
    hash = "sha256-6QRI1MQnoppzlVfRV/bfqfTnBjC0/haFm52Ez9nltzw=";
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
