{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "ytui";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule rec {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  vendorHash = "sha256-/Xit/WU/MB3imK0eR1QSvtjIZz32/rhLMeWD7OxPalQ=";

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
