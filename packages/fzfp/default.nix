{
  writeShellApplication,
  fzf,
  tmux,
  gawk,
  ...
}:
writeShellApplication {
  name = "fzfp";

  runtimeInputs = [
    fzf
    tmux
    gawk
  ];

  text = builtins.readFile ./fzfp.sh;
}
