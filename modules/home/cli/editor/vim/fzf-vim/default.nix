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
          plugins = with pkgs.vimPlugins; [ fzf-vim ];
          extraConfig = ''
            let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
          '';
        };
      };
    }
  )
)
