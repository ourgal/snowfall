{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "termsand";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-E7EjEw8AmxqjbLrKuoRnVhiFPPDKrKGJiS3lfE9Psdk=";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/ourgal/termsand";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "termsand";
  };
}
