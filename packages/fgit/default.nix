{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "fgit";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "fastgh";
    repo = "fgit";
    rev = "v${version}";
    hash = "sha256-27GZp1qd0pJg9usIxj8wl1Dz+4ZC0273bb1tJ4Hhc9s=";
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
