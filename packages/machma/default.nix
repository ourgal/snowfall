{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname version src;

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
