args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.fish.functions.tere = {
        body = # fish
          ''
            set --local result (${lib.getExe pkgs.tere} $argv)
            test -n "$result" && cd -- "$result"
          '';
      };
    }
  )
)
