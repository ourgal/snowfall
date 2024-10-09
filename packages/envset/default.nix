{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "envset";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname src version;

  cargoHash = "sha256-PNE2yemOFR5WsfXt6Yu4iWQaTMlqflRcFqG9UrkUnJw=";

  meta = with lib; {
    description = "Set values in .env files the fun way";
    homepage = "https://github.com/schpet/envset";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "envset";
  };
}
