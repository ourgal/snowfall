{
  lib,
  python3,
  fetchFromGitHub,
  procps,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "px";
  version = "3.6.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "walles";
    repo = "px";
    rev = version;
    hash = "sha256-G0Fy6d8k5TB2yVDZKsMvuoASNAXm3Zt8z4ZzxZAfEH4=";
  };

  postPatch = ''
    substituteInPlace ./devbin/update_version_py.py \
      --replace-fail '["git", "describe", "--dirty"]' '["echo", "${version}"]'
    substituteInPlace ./setup.py \
      --replace-fail '["git", "describe", "--dirty"]' '["echo", "${version}"]'
    substituteInPlace ./px/px_process.py \
      --replace-fail '/bin/ps' '${procps}/bin/ps'
  '';

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
    python3.pkgs.pytest-runner
  ];

  meta = with lib; {
    description = "Ps, top and pstree for human beings";
    homepage = "https://github.com/walles/px";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "px";
  };
}
