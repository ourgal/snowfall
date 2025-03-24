{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-4ZhAPdENy1fEMKkLLf4RktcKpG8u52G2FG3kpOU3cvY=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Sum the time-tracking \"/spend\" commands of commit messages";
    homepage = "https://github.com/Goutte/git-spend";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-spend";
  };
}
