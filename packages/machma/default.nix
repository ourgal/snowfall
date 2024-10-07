{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "machma";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  vendorHash = "sha256-mu80QFccIHGqzHfj5zueO+P74p4irFfmU+cDgmn8URQ=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Easy parallel execution of commands with live feedback";
    homepage = "https://github.com/fd0/machma";
    license = licenses.bsd2;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "machma";
  };
}
