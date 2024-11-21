{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.sig
  // {
    meta = with lib; {
      description = "Interactive grep (for streaming";
      homepage = "https://github.com/ynqa/sig";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "sig";
    };
  }
)
