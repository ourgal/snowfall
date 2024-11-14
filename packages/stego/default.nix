{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.stego) pname version src;

  cargoHash = "sha256-qfrVORbIQP2/u9UK0Ja14/uONNDfzxyhMIY4SGxeKqs=";

  meta = with lib; {
    description = "Stego is a steganographic swiss army knife";
    homepage = "https://github.com/ajmwagar/stego";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "stego";
  };
}
