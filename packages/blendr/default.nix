{
  lib,
  rustPlatform,
  pkg-config,
  dbus,
  libxkbcommon,
  stdenv,
  darwin,
  wayland,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.blendr
  // {
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
)
