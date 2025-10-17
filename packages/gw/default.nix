{
  lib,
  rustPlatform,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    nativeBuildInputs = [ pkg-config ];

    buildInputs = [
      libgit2
      openssl
      zlib
    ]
    ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    env = {
      OPENSSL_NO_VENDOR = true;
    };

    doCheck = false;

    meta = with lib; {
      description = "Watch local git repositories, keep in sync with remote and run commands";
      homepage = "https://github.com/daniel7grant/gw";
      changelog = "https://github.com/daniel7grant/gw/blob/${src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "gw";
    };
  }
)
