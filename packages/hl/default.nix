{
  lib,
  rustPlatform,
  _sources,
  pkg-config,
  bzip2,
  xz,
  zstd,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.hl) pname version src;

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "htp-0.4.2" = "sha256-oYLN0aCLIeTST+Ib6OgWqEgu9qyI0n5BDtIUIIThLiQ=";
      "wildflower-0.3.0" = "sha256-vv+ppiCrtEkCWab53eutfjHKrHZj+BEAprV5by8plzE=";
    };
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs =
    [
      bzip2
      xz
      zstd
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
    ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = {
    description = "A fast and powerful log viewer and processor that translates JSON logs or logfmt logs into a pretty human-readable format";
    homepage = "https://github.com/pamburus/hl";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "hl";
  };
}
