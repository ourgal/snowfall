args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "eslint"
        "flow"
        "nodejs"
        "pnpm"
        "quick-lint-js"
        "taze"
        "yarn"
        # keep-sorted end
      ];
      files = {
        ".npmrc" = ''
          registry = https://registry.npmmirror.com
          coc.nvim:registry=https://registry.npmmirror.com/'';
      };
      tmpfiles = [ "d ${config.xdg.dataHome}/pnpm - - - - -" ];
      sessionPath = [ "$HOME/.local/share/pnpm" ];
      env.PNPM_HOME = "$HOME/.local/share/pnpm";
    }
  )
)
