{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "termsand";
  version = "unstable-2024-08-15";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "termsand";
    rev = "75a50ba82ed299047cd5d0cd53b6fce390cfc6e8";
    hash = "sha256-tylzyjg3AJutwnrxjxzshEfuTD14VegCIMb/wroGpj0=";
  };

  cargoHash = "sha256-E7EjEw8AmxqjbLrKuoRnVhiFPPDKrKGJiS3lfE9Psdk=";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/ourgal/termsand";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "termsand";
  };
}
