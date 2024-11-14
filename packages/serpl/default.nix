{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.serpl) pname version src;

  cargoHash = "sha256-8XYEZQfoizVmOuh0hymzMj2UDiXNkSeHqBAWOqaMY84=";

  meta = with lib; {
    description = "A simple terminal UI for search and replace, ala VS Code";
    homepage = "https://github.com/yassinebridi/serpl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serpl";
  };
}
