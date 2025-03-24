{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    nativeBuildInputs = [ pkg-config ];

    buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    doCheck = false;

    meta = with lib; {
      description = "A CLI tool to keep track of templates and generate files from them";
      homepage = "https://github.com/cophilot/templify";
      changelog = "https://github.com/cophilot/templify/blob/${src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "templify";
    };
  }
)
