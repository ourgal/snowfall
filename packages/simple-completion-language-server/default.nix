{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    checkFlags = [ "--skip=citations" ];

    meta = with lib; {
      description = "Language server to enable word completion and snippets for Helix editor";
      homepage = "https://github.com/estin/simple-completion-language-server";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "simple-completion-language-server";
    };
  }
)
