args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.git.hooks = {
        pre-commit = "${pkgs.${namespace}.git-pre-commit}/bin/git-pre-commit";
        commit-msg = "${pkgs.${namespace}.git-commit-msg}/bin/git-commit-msg";
      };
    }
  )
)
