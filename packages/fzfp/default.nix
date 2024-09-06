{
  writeShellApplication,
  fzf,
  tmux,
  gawk,
  ...
}:
writeShellApplication {
  name = "fzfp";

  checkPhase = "";

  runtimeInputs = [
    fzf
    tmux
    gawk
  ];

  text = builtins.readFile ./fzfp.sh;
}
