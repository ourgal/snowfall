{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = {
        nixvim = {
          extraPlugins = [ pkgs.vimPlugins.persisted-nvim ];
        };
      };
    }
  )
)
