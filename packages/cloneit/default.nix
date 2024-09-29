{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "cloneit";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "alok8bb";
    repo = "cloneit";
    rev = version;
    hash = "sha256-CyR/vdg6xqlxmv8jOXka3JIBhi8zafHiBOL67XLf5KM=";
  };

  cargoHash = "sha256-zhsFIU7gmP4gR5NhrFslFSvYIXH1fxJLZU8nV67PluQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "A cli tool to download specific GitHub directories or files";
    homepage = "https://github.com/alok8bb/cloneit";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cloneit";
  };
}
