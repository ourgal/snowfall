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
          plugins = with pkgs.${namespace}; [ git-messager-vim ];
          extraConfig = ''
            let g:git_messenger_no_default_mappings = v:true
            nmap <Leader>gm <Plug>(git-messenger)
          '';
        };
      };
    }
  )
)
