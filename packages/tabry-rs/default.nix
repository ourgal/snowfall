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

  cargoHash = "sha256-SSwMsIG+l69p7ce0FxqSK/Xn5335RWlbN6VSIOZYAh0=";

  meta = with lib; {
    description = "Shell (tab) completion engine";
    homepage = "https://github.com/evanbattaglia/tabry-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tabry-rs";
  };
}
