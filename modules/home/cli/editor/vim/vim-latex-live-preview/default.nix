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
          plugins = with pkgs.vimPlugins; [ vim-latex-live-preview ];
          extraConfig = ''
            let g:livepreview_previewer = 'zathura'
            let g:livepreview_engine = 'xelatex'
          '';
        };
      };
    }
  )
)
