args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.nixvim.extraPlugins = [ pkgs.vimPlugins.persisted-nvim ];
    }
  )
)
