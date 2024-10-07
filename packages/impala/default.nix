{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "impala";
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

  cargoHash = "sha256-IMvlGAD9DB00luu9F4UKxwSYt0sV+IU8Pb7r10VtyYg=";

  meta = with lib; {
    description = "TUI for managing wifi on Linux";
    homepage = "https://github.com/pythops/impala";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "impala";
  };
}
