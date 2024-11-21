{
  lib,
  rustPlatform,
  pkg-config,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.rimage
  // {
    nativeBuildInputs = [ pkg-config ];

    doCheck = false;

    meta = with lib; {
      description = "This is CLI tool inspired by squoosh";
      homepage = "https://github.com/SalOne22/rimage";
      changelog = "https://github.com/SalOne22/rimage/blob/${src.rev}/CHANGELOG.md";
      license = with licenses; [
        asl20
        mit
      ];
      maintainers = with maintainers; [ zxc ];
      mainProgram = "rimage";
    };
  }
)
