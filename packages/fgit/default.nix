{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-vCi04OruIuJ0w29TpqTf17GaWvoeJQjCTNQZp1ZqLgs=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "加速100～3000倍的github.com";
      homepage = "https://github.com/fastgh/fgit";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "fgit";
    };
  }
)
