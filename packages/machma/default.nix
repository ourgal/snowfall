{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "machma";
  version = "unstable-2021-01-02";

  src = fetchFromGitHub {
    owner = "fd0";
    repo = "machma";
    rev = "9ab93d72e36fe2cbb15af37c914605212ac28642";
    hash = "sha256-VmyWAsWIe6dhLq7UEit389v3fnQqRwZYk5gY6gj6Q3M=";
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
