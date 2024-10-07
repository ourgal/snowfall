{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "gh-stars";
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

  vendorHash = "sha256-kqo2iGk5omOqGtmKPak70PaMJPxKvOGFnSBZX0++WQk=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "GitHub stargazers in your terminal";
    homepage = "https://github.com/aymanbagabas/gh-stars";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-stars";
  };
}
