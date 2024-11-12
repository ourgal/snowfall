{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.impala) pname version src;

  cargoLock = _sources.impala.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "TUI for managing wifi on Linux";
    homepage = "https://github.com/pythops/impala";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "impala";
  };
}
