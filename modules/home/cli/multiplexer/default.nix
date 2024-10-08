{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      nixPkgs = "vtm";
      enable = [ { tmux.resurrect = enabled; } ];
    }
  )
)
