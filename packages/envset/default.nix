{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "envset";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-PNE2yemOFR5WsfXt6Yu4iWQaTMlqflRcFqG9UrkUnJw=";

  meta = with lib; {
    description = "Set values in .env files the fun way";
    homepage = "https://github.com/schpet/envset";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "envset";
  };
}
