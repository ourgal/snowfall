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
  deno,
}:

rustPlatform.buildRustPackage rec {
  pname = "pipelight";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "pipelight";
    repo = "pipelight";
    rev = "v${version}";
    hash = "sha256-yJfE8fKjPaVdrMMOiY6VIBCjBfZZoFQohCZ3iHgfhZI=";
  };

  cargoHash = "sha256-CoOVJ86bPXZNkKHICRN3sQ2/GFyTI6hPgZlSRe95lL8=";

  nativeBuildInputs = [ pkg-config ];

  postPatch = ''
    substituteInPlace ./cast/src/config/load/typescript/mod.rs \
      --replace-fail 'deno' '${lib.getExe deno}'
  '';

  buildInputs = [
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
    changelog = "https://github.com/pipelight/pipelight/blob/${src.rev}/CHANGELOG.md";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pipelight";
  };
}
