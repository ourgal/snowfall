args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      nixPkgs = "deno";
      progs.vim.plugins = with pkgs.vimPlugins; [
        denops-vim
        pkgs.${namespace}.dps-ghosttext-vim
      ];
    }
  )
)
