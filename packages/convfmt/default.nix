{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "convfmt";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoHash = "sha256-OVCnY0/hw+VOIvDYcQO/FEQk3W0qQOqAPW8SAYG0xyY=";

  meta = with lib; {
    description = "Cli tool which can convert different formats";
    homepage = "https://github.com/oriontvv/convfmt";
    changelog = "https://github.com/oriontvv/convfmt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "convfmt";
  };
}
