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
      description = "Small command to run other commands in a given directory";
      homepage = "https://github.com/dotboris/cdo";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "cdo";
    };
  }
)
