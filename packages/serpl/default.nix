{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.serpl
  // {
    meta = with lib; {
      description = "A simple terminal UI for search and replace, ala VS Code";
      homepage = "https://github.com/yassinebridi/serpl";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "serpl";
    };
  }
)
