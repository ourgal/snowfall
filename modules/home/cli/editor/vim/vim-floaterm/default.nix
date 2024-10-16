{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.${namespace}; [ vim-floaterm ];
          extraConfig = ''
            let g:floaterm_opener = 'edit'
            let g:floaterm_height = 0.999
            let g:floaterm_width = 0.99

            nnoremap <silent> <F12> <cmd>FloatermToggle<CR>
            tnoremap <silent> <F12> <C-\><C-n><cmd>FloatermToggle<CR>
            nnoremap <C-g> <cmd>FloatermNew lazygit<cr>

            command Nnn FloatermNew nnn
            command Lf FloatermNew lf
          '';
        };
      };
    }
  )
)
