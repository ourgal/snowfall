{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  propagatedBuildInputs = with python3Packages; [ gitpython ];

  patches = [ ./vim_key.patch ];

  meta = with lib; {
    description = "A git command to play back file history";
    homepage = "https://github.com/jianli/git-playback";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-playback";
  };
}
