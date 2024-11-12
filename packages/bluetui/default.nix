{
  lib,
  rustPlatform,
  pkg-config,
  dbus,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.bluetui) pname src version;

  cargoLock = _sources.bluetui.cargoLock."Cargo.lock";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ dbus ];

  meta = with lib; {
    description = "TUI for managing bluetooth on Linux";
    homepage = "https://github.com/pythops/bluetui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "bluetui";
  };
}
