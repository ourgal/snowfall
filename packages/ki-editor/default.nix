{
  lib,
  rustPlatform,
  fetchFromGitHub,
  curl,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  git,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "ki-editor";
  version = "unstable-2024-12-11";

  src = fetchFromGitHub {
    owner = "ki-editor";
    repo = "ki-editor";
    rev = "fee703a840f3c20080e52159243fd2cfc65b44cd";
    hash = "sha256-S+3uFsWQ5bD+lDI8qdYQ5tFx4FeM//DWSxn7VvcaYHQ=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ast-grep-core-0.25.4" = "sha256-uG5usklopxKmntVj//pH9vZzBzhG49vdy9Z1e2fIH2U=";
      "tree-sitter-traversal-0.1.3" = "sha256-ZtR6tK8y1dwA9j64lXCwI60RDRloXdd7u8gmjYU8iRc=";
    };
  };

  nativeBuildInputs = [
    curl
    git
    pkg-config
  ];

  doCheck = false;

  buildInputs = [
    curl
    libgit2
    openssl
    zlib
  ]
  ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.CoreGraphics
    darwin.apple_sdk.frameworks.Security
  ];

  meta = {
    description = "";
    homepage = "https://github.com/ki-editor/ki-editor";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "ki-editor";
  };
}
