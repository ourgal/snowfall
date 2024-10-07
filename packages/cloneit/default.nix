{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  namespace,
}:
let
  pname = "cloneit";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-nX/G5m6hdjfsC3YrCvqOfT3LQYrRnQ5/lNLS1Lv5f24=";

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
