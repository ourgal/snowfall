{ writeShellApplication, ... }:
writeShellApplication {
  name = "fzfp";

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./fzfp.sh;
}
