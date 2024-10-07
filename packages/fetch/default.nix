{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "fetch";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
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

  vendorHash = "sha256-WS1DZqExyXYRs+4PsXzgMa+wUx1L+Y8KEaK7P5JVMOk=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Download files, folders, and release assets from a specific git commit, branch, or tag of public and private GitHub repos";
    homepage = "https://github.com/gruntwork-io/fetch";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fetch";
  };
}
