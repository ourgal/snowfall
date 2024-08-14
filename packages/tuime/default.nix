{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "tuime";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "nate-sys";
    repo = "tuime";
    rev = "v${version}";
    hash = "sha256-9CGktRXx7IZ0yv/U78SWSifJ6YBIiV8cf5Dq60PPCcQ=";
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
