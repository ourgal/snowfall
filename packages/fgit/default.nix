{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "fgit";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
