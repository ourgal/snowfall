{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule rec {
  inherit (_sources' ./.) pname src version;

  vendorHash = "sha256-VE3nnUO3A/HkaoGXef+zuPT2VubWiDfiiSils0F0l74=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Paclear is a clear command with PAC-MAN animation";
    homepage = "https://github.com/orangekame3/paclear";
    changelog = "https://github.com/orangekame3/paclear/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "paclear";
  };
}
