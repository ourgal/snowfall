{
  lib,
  rustPlatform,
  pkg-config,
  zstd,
  stdenv,
  darwin,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.mdsf
  // {

    nativeBuildInputs = [ pkg-config ];

    buildInputs =
      [ zstd ]
      ++ lib.optionals stdenv.isDarwin [
        darwin.apple_sdk.frameworks.Security
        darwin.apple_sdk.frameworks.SystemConfiguration
      ];

    doCheck = false;

    env = {
      ZSTD_SYS_USE_PKG_CONFIG = true;
    };

    meta = {
      description = "Format, and lint, markdown code snippets using your favorite tools";
      homepage = "https://github.com/hougesen/mdsf";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "mdsf";
    };
  }
)
