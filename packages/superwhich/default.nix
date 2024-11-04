{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:

let
  pname = "superwhich";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname src version;

  cargoHash = "sha256-ex3ozdKO7u1jTB8opaqwUngMo9qlS4GzYF2o5H1n8cI=";

  meta = with lib; {
    description = "Cross-platform smart which alternative";
    homepage = "https://github.com/DarkCeptor44/superwhich";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "superwhich";
  };
}
