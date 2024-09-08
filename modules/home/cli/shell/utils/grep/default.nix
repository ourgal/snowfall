{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "sig";
    nixPkgs = [
      # keep-sorted start
      "ast-grep"
      "ripgrep"
      "ugrep"
      # keep-sorted end
    ];
    progs = {
      fish.functions = {
        sg = {
          body = ''
            ast-grep $argv
          '';
          description = "ast-grep alias";
        };
      };
    };
  }
)
