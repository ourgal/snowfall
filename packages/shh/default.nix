{
  lib,
  rustPlatform,
  namespace,
  _sources,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.shh
  // {
    doCheck = false;

    meta = {
      description = "Systemd Hardening Helper - Automatic systemd service hardening guided by strace profiling";
      homepage = "https://github.com/desbma/shh";
      license = lib.licenses.gpl3Only;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "shh";
    };
  }
)
