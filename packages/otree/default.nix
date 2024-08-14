{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "otree";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "fioncat";
    repo = "otree";
    rev = "v${version}";
    hash = "sha256-M6xmz7aK+NNZUDN8NJCUEODwotJ9VeY3bsueFpwjjjs=";
  };

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
