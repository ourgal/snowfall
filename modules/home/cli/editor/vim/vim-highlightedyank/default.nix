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
          plugins = with pkgs.vimPlugins; [ vim-highlightedyank ];
          extraConfig = ''
            let g:highlightedyank_highlight_duration = 300
          '';
        };
      };
    }
  )
)
