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
      description = "Shell (tab) completion engine";
      homepage = "https://github.com/evanbattaglia/tabry-rs";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "tabry-rs";
    };
  }
)
