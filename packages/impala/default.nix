{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "impala";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "pythops";
    repo = "impala";
    rev = "v${version}";
    hash = "sha256-0ULcknkZKYEvuqlcY8E1kZtpA0lPxxjRV2/zfak+FKU=";
  };

  cargoHash = "sha256-1jFUfpinqXBu8eTFAA1dRDk1F1IhNjcA7CkJmaIjkFQ=";

  meta = with lib; {
    description = "TUI for managing wifi on Linux";
    homepage = "https://github.com/pythops/impala";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "impala";
  };
}
