{
  lib,
  rustPlatform,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.koji
  // {
    nativeBuildInputs = [ pkg-config ];

    buildInputs = [
      libgit2
      openssl
      zlib
    ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    env = {
      OPENSSL_NO_VENDOR = true;
    };

    meta = with lib; {
      description = "An interactive CLI for creating conventional commits";
      homepage = "https://github.com/cococonscious/koji";
      changelog = "https://github.com/cococonscious/koji/blob/${src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "koji";
    };
  }
)
