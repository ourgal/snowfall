{
  lib,
  namespace,
  rustPlatform,
  _sources',
  pkg-config,
  protobuf,
  bzip2,
  libgit2,
  oniguruma,
  openssl,
  xz,
  zlib,
  zstd,
  stdenv,
  darwin,
  git,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    nativeBuildInputs = [
      pkg-config
      protobuf
      git
    ];

    buildInputs = [
      bzip2
      libgit2
      oniguruma
      openssl
      xz
      zlib
      zstd
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.IOKit
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
    ];

    env = {
      OPENSSL_NO_VENDOR = true;
      RUSTONIG_SYSTEM_LIBONIG = true;
      ZSTD_SYS_USE_PKG_CONFIG = true;
    };

    doCheck = false;

    meta = {
      description = "Qlty CLI: Universal linting, formatting, maintainability, security scanning, and metrics";
      homepage = "https://github.com/qltysh/qlty";
      license = lib.licenses.bsl11;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "qlty";
    };
  }
)
