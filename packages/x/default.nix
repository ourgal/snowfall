{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "x";
  version = "1.1.4";

  src = fetchFromGitHub {
    owner = "devhindo";
    repo = "x";
    rev = "v${version}";
    hash = "sha256-sAmyZFX9lZ6UXVCt7st187Ie6aVW0dSUlQQQmLiHUlM=";
  };

  sourceRoot = "${src.name}/src/cli";

  vendorHash = "sha256-kzMvksDjhqKlHvBwl0spOApFKHKM7lm0WG2hifP6+Ro=";

  meta = with lib; {
    description = "Post tweets from terminal";
    homepage = "https://github.com/devhindo/x";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "x";
    platforms = platforms.all;
  };
}
