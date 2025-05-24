{
  lib,
  rustPlatform,
  namespace,
  _sources',
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {

    meta = with lib; {
      description = "Clone a git repository into a standard location organised by domain and path";
      homepage = "https://github.com/wezm/git-grab";
      license = with licenses; [
        asl20
        mit
      ];
      maintainers = with maintainers; [ zxc ];
      mainProgram = "git-grab";
    };
  }
)
