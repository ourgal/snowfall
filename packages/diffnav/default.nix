{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.diffnav) pname src version;

  vendorHash = "sha256-2JjQF+fwl8+Xoq9T3jCvngRAOa3935zpi9qbF4w4hEI=";

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
