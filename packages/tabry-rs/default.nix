{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "tabry-rs";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-aDqO8BCQKB4/Qtatw9q5zgKPqUfRYS4M5VIyAhkCVcg=";

  meta = with lib; {
    description = "Shell (tab) completion engine";
    homepage = "https://github.com/evanbattaglia/tabry-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tabry-rs";
  };
}
