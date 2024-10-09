{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "gh-stars";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
