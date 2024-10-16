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
          plugins = with pkgs.vimPlugins; [ caw-vim ];
          extraConfig = ''
            let g:caw_no_default_keymappings = 1
            nnoremap <silent> gc <Plug>(caw:hatpos:toggle)
            xnoremap <silent> gc <Plug>(caw:hatpos:toggle)
          '';
        };
      };
    }
  )
)
