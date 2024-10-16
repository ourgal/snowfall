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
          plugins = with pkgs.${namespace}; [ git-lens-vim ];
          extraConfig = ''
            let g:GIT_LENS_ENABLED = v:false
            command! ToggleGitLens call ToggleGitLens()
            nnoremap <leader>gl <cmd>call ToggleGitLens()<cr>
          '';
        };
      };
    }
  )
)
