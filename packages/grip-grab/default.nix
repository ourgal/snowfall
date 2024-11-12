{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.grip-grab) pname version src;

  cargoLock = _sources.grip-grab.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Hold on tight";
    homepage = "https://github.com/alexpasmantier/grip-grab";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "grip-grab";
  };
}
