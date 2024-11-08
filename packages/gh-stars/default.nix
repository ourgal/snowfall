{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.gh-stars) pname src version;

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
