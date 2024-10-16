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
        vim = {
          plugins = with pkgs.vimPlugins; [ catppuccin-vim ];
          extraConfig = ''
            colorscheme catppuccin_mocha
          '';
        };
      };
    }
  )
)
