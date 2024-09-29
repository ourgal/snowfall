{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "serie";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "lusingander";
    repo = "serie";
    rev = "v${version}";
    hash = "sha256-RP9Tv6IrDfawjXCQp0nB0nd7b6IwkdykHcEfGEguFHo=";
  };

  cargoHash = "sha256-HxIyWlFKDRod5nSENZguNYz/vn+E9Ux0K3dMhX7I/zQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.CoreGraphics
  ];

  meta = with lib; {
    description = "A rich git commit graph in your terminal, like magic";
    homepage = "https://github.com/lusingander/serie";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serie";
  };
}
