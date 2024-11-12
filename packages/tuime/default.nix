{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.tuime) pname version src;

  cargoLock = _sources.tuime.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Tui clock written in rust";
    homepage = "https://github.com/nate-sys/tuime";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tuime";
  };
}
