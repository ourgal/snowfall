{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-playback";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = "unstable-${source.date}";
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
