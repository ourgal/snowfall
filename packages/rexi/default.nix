{ pkgs, ... }:
let
  advance-touch =
    {
      lib,
      buildPythonPackage,
      fetchFromGitHub,
      pythonOlder,
      poetry-core,
      typer,
      colorama,
      textual,
      pythonRelaxDepsHook,
      ...
    }:

    buildPythonPackage rec {
      pname = "rexi";
      version = "1.1.3";
      disabled = pythonOlder "3.8";

      src = fetchFromGitHub {
        owner = "royreznik";
        repo = pname;
        rev = "v${version}";
        hash = "sha256-i1iHFnvuxLwMqokuJD0K8pKTJJgGbI0NT5WQ1+6lK0E=";
      };

      format = "pyproject";

      propagatedBuildInputs = [
        typer
        colorama
        textual
      ];

      nativeBuildInputs = [
        poetry-core
        pythonRelaxDepsHook
      ];

      pythonRelaxDeps = true;

      meta = with lib; {
        description = "Terminal UI for Regex Testing";
        mainProgram = "rexi";
        homepage = "https://github.com/royreznik/rexi";
        license = licenses.mit;
        maintainers = with maintainers; [ zxc ];
      };
    };
in
pkgs.python3Packages.callPackage advance-touch { }
