{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "git-playback";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

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
