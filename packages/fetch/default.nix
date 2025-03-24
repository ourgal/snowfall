{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname src version;

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
