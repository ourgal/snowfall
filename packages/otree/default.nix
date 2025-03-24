{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.IOKit ];

    meta = with lib; {
      description = "A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget";
      homepage = "https://github.com/fioncat/otree";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "otree";
    };
  }
)
