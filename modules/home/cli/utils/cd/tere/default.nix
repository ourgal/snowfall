args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.fish.functions.tere = {
        body = # fish
          ''
            set --local result (${pkgs.tere}/bin/tere $argv)
            test -n "$result" && cd -- "$result"
          '';
      };
    }
  )
)
