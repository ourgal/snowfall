{
  lib,
  rustPlatform,
  pkg-config,
  dbus,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.bluetui
  // {
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
)
