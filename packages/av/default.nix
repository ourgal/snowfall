{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
}:

buildGoModule rec {
  pname = "av";
  version = "0.0.42";

  src = fetchFromGitHub {
    owner = "aviator-co";
    repo = "av";
    rev = "v${version}";
    hash = "sha256-vhXI2D0GRWq7GNG2dWgg6FznC4B54FC9P+nF9JfYu/A=";
  };

  vendorHash = "sha256-I8PlVeouAPT7h1xdy2zJrtNCrb0HTb0s4+3fu0jNlgk=";

  ldflags = [ "-X=github.com/aviator-co/av/internal/config.Version=v${version}" ];

  nativeBuildInputs = [ git ];

  meta = with lib; {
    description = "A command line tool to manage stacked PRs with Aviator";
    homepage = "https://github.com/aviator-co/av";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "av";
  };
}
