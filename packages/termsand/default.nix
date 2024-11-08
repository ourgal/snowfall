{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.termsand) pname version src;

  cargoHash = "sha256-E7EjEw8AmxqjbLrKuoRnVhiFPPDKrKGJiS3lfE9Psdk=";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/ourgal/termsand";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "termsand";
  };
}
