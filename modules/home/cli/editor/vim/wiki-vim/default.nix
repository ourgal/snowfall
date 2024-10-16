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
          plugins = with pkgs.vimPlugins; [ wiki-vim ];
          extraConfig = ''
            let g:wiki_root = '~/workspace/wiki'
          '';
        };
      };
    }
  )
)
