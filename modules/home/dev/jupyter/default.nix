args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = [
      # keep-sorted start
      "jupyterlab"
      "jupyterlab-git"
      "jupyterlab-lsp"
      "nbformat"
      # keep-sorted end
    ];
  }
)
