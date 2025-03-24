{
  lib,
  rustPlatform,
  _sources',
}:
rustPlatform.buildRustPackage {
  inherit (_sources' ./.) pname version src;

  cargoHash = "sha256-oWkluCAhp/+KMY2kZiX586w2ZRP9UBG7DxBwvI3LH04=";

  meta = with lib; {
    description = "Hold on tight";
    homepage = "https://github.com/alexpasmantier/grip-grab";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "grip-grab";
  };
}
