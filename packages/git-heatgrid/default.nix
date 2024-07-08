{
  writeShellApplication,
  lib,
  fetchFromGitHub,
  ...
}:
writeShellApplication rec {
  name = "git-heatgrid";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (
    fetchFromGitHub {
      owner = "denshakhov";
      repo = "git-heatgrid";
      rev = "2263ce34d2929652e6cfe31fe076577dfcefd168";
      hash = "sha256-nBiZfwiWmwM0a839NaDsCouJtL2d0HYHIZ+FFGrmzjM=";
    }
    + /git-heatgrid
  );
}
