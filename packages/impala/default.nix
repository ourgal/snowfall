{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "impala";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-IMvlGAD9DB00luu9F4UKxwSYt0sV+IU8Pb7r10VtyYg=";

  meta = with lib; {
    description = "TUI for managing wifi on Linux";
    homepage = "https://github.com/pythops/impala";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "impala";
  };
}
