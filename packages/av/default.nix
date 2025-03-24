{
  lib,
  buildGoModule,
  _sources',
  git,
}:

buildGoModule rec {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-j/f/j8cYJi1ESmjHQpy+ilpy5Y++n9aNwpe1b02Eusw=";

  ldflags = [ "-X=github.com/aviator-co/av/internal/config.Version=v${version}" ];

  nativeBuildInputs = [ git ];

  meta = {
    description = "A command line tool to manage stacked PRs with Aviator";
    homepage = "https://github.com/aviator-co/av";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "av";
  };
}
