{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.superwhich) pname src version;

  cargoLock = _sources.superwhich.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Cross-platform smart which alternative";
    homepage = "https://github.com/DarkCeptor44/superwhich";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "superwhich";
  };
}
