{
  lib,
  rustPlatform,
  pkg-config,
  dbus,
  namespace,
  pkgs,
}:
let
  pname = "bluetui";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname src version;

  cargoHash = "sha256-w6rrZQNu5kLKEWSXFa/vSqwm76zWZug/ZqztMDY7buE=";

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
