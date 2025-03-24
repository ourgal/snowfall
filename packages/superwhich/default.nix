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
      description = "Cross-platform smart which alternative";
      homepage = "https://github.com/DarkCeptor44/superwhich";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "superwhich";
    };
  }
)
