{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    meta = with lib; {
      description = "";
      homepage = "https://github.com/ourgal/termsand";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "termsand";
    };
  }
)
