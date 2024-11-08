{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.envset) pname src version;

  cargoHash = "sha256-PNE2yemOFR5WsfXt6Yu4iWQaTMlqflRcFqG9UrkUnJw=";

  meta = with lib; {
    description = "Set values in .env files the fun way";
    homepage = "https://github.com/schpet/envset";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "envset";
  };
}
