{
  lib,
  rustPlatform,
  pkg-config,
  bzip2,
  xz,
  zlib,
  stdenv,
  darwin,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.dra
  // {
    nativeBuildInputs = [ pkg-config ];

    buildInputs = [
      bzip2
      xz
      zlib
    ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    doCheck = false;

    meta = with lib; {
      description = "A command line tool to download release assets from GitHub";
      homepage = "https://github.com/devmatteini/dra";
      changelog = "https://github.com/devmatteini/dra/blob/${src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "dra";
    };
  }
)
