{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "diffnav";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "dlvhdr";
    repo = "diffnav";
    rev = "v${version}";
    hash = "sha256-BJkF74Q8o9ck7fo/0nZR7xK52ZObdTqaD+xayZW+GtA=";
  };

  vendorHash = "sha256-2EzhXGrtitG7yON9IgPbqxf0yJHWaPQtvzVoL8C6Jao=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A git diff pager based on delta but with a file tree, à la GitHub";
    homepage = "https://github.com/dlvhdr/diffnav";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "diffnav";
  };
}
