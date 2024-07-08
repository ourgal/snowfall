{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      fish = {
        functions = {
          tere = {
            body = # fish
              ''
                set --local result (${pkgs.tere}/bin/tere $argv)
                test -n "$result" && cd -- "$result"
              '';
          };
        };
      };
    };
  }
)
