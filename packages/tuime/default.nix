{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "tuime";
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

  cargoHash = "sha256-0Y/fE1ydvVg/oOwbZ/49zUDD/84FYq8BQ3mfgbtTrSE=";

  meta = with lib; {
    description = "Tui clock written in rust";
    homepage = "https://github.com/nate-sys/tuime";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tuime";
  };
}
