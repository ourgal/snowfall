{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "pipelight";
  version = "0.7.24";

  src = fetchFromGitHub {
    owner = "pipelight";
    repo = "pipelight";
    rev = "v${version}";
    hash = "sha256-BgSOmmVDJvAGT2SdFaR0a1wqE1NH8ERjZGg0gOXwPu8=";
  };

  cargoHash = "sha256-OmhGdhCxAiTMaNeksMAMzZmBqsayeclMdhAERR3DVeU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs =
    [
      libgit2
      openssl
      zlib
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.IOKit
      darwin.apple_sdk.frameworks.Security
    ];

  doCheck = false;

  meta = with lib; {
    description = "Tiny automation pipelines. Bring CI/CD to the smallest projects. Self-hosted, Lightweight, CLI only";
    homepage = "https://github.com/pipelight/pipelight";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pipelight";
  };
}
