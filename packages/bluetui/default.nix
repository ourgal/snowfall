{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  dbus,
  namespace,
}:
let
  pname = "bluetui";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
