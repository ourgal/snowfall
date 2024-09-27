{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication {
  pname = "git-playback";
  version = "unstable-2016-03-23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jianli";
    repo = "git-playback";
    rev = "0d4a51993b8a1b58579964e883fd344f6b92763b";
    hash = "sha256-lHqr+4dFFbktTI1J4Qu3t3BmV6xA32H2o5yOgaJJcNs=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [ gitpython ];

  patches = [ ./vim_key.patch ];

  meta = with lib; {
    description = "A git command to play back file history";
    homepage = "https://github.com/jianli/git-playback";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-playback";
  };
}
