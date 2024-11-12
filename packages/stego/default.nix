{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.stego) pname version src;

  cargoLock = _sources.stego.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Stego is a steganographic swiss army knife";
    homepage = "https://github.com/ajmwagar/stego";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "stego";
  };
}
