{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "play";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "paololazzari";
    repo = "play";
    rev = "v${version}";
    hash = "sha256-l6nYyfNqm3hunNQqteQWAVJSdeJG2O2FPb6IypHw6CA=";
  };

  vendorHash = "sha256-9eP0rhsgpTttYrBG/BNk/ICtaM+zKNBz2H2cHuTSt30=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "A TUI playground to experiment with your favorite programs, such as grep, sed, awk, jq and yq";
    homepage = "https://github.com/paololazzari/play";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "play";
  };
}
