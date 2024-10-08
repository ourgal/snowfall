{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "otree";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "tui-tree-widget-0.20.0" = "sha256-/uLp63J4FoMT1rMC9cv49JAX3SuPvFWPtvdS8pspsck=";
    };
  };

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.IOKit ];

  meta = with lib; {
    description = "A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget";
    homepage = "https://github.com/fioncat/otree";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "otree";
  };
}
