{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-R1qLdAECY6t8XI6WdyXubbKowmbx7gBp9JlRogOHDeo=";

    ldflags = [
      "-s"
      "-w"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Download files, folders, and release assets from a specific git commit, branch, or tag of public and private GitHub repos";
      homepage = "https://github.com/gruntwork-io/fetch";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "fetch";
    };
  }
)
