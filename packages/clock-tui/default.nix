{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    postInstall = "rm $out/bin/xtask";
    meta = {
      description = "A clock app in terminal written in Rust, supports local clock, timer and stopwatch";
      homepage = "https://github.com/race604/clock-tui";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "tclock";
    };
  }
)
