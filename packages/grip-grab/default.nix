{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "grip-grab";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-oWkluCAhp/+KMY2kZiX586w2ZRP9UBG7DxBwvI3LH04=";

  meta = with lib; {
    description = "Hold on tight";
    homepage = "https://github.com/alexpasmantier/grip-grab";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "grip-grab";
  };
}
