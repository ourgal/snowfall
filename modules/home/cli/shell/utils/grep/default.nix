{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "hypergrep"
      "sig"
      # keep-sorted end
    ];
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
