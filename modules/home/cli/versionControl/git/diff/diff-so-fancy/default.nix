{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      progs = {
        git.diff-so-fancy = enabled;
      };
    }
  )
)
