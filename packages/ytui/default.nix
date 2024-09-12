{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ytui";
  version = "0.0.3";

  src = fetchFromGitHub {
    owner = "Banh-Canh";
    repo = "ytui";
    rev = "v${version}";
    hash = "sha256-uyCAJAw11EOjah4cGiivY6r8yvTc/Lzx+wr4R1HCbwc=";
  };

  vendorHash = "sha256-k478/jGbqD2sKOqfxQ4Xl8vvKkLLThh0xo3LowuWutQ=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/banh-canh/ytui/cmd.version=${version}"
  ];

  doCheck = false;

  postInstall = "rm $out/bin/scripts";

  meta = with lib; {
    description = "Ytui is a TUI tool that allows users to query videos on youtube and play them in their local player";
    homepage = "https://github.com/Banh-Canh/ytui";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ytui";
  };
}
