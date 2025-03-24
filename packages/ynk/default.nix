{
  lib,
  rustPlatform,
  pkg-config,
  sqlite,
  stdenv,
  darwin,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    nativeBuildInputs = [ pkg-config ];

    buildInputs = [ sqlite ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    meta = with lib; {
      description = "A Better copy and paste for the terminal i.e cp and mv on steriods";
      homepage = "https://github.com/newtoallofthis123/ynk";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "ynk";
    };
  }
)
