{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "serpl";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  inherit (source) version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-8XYEZQfoizVmOuh0hymzMj2UDiXNkSeHqBAWOqaMY84=";

  meta = with lib; {
    description = "A simple terminal UI for search and replace, ala VS Code";
    homepage = "https://github.com/yassinebridi/serpl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serpl";
  };
}
