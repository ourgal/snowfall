{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "fgit";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
