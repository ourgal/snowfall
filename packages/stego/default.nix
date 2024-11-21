{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.stego
  // {
    meta = with lib; {
      description = "Stego is a steganographic swiss army knife";
      homepage = "https://github.com/ajmwagar/stego";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "stego";
    };
  }
)
