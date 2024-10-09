{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "serpl";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-8XYEZQfoizVmOuh0hymzMj2UDiXNkSeHqBAWOqaMY84=";

  meta = with lib; {
    description = "A simple terminal UI for search and replace, ala VS Code";
    homepage = "https://github.com/yassinebridi/serpl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serpl";
  };
}
