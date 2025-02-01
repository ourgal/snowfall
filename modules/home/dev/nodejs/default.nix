args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "nodejs"
        "pnpm"
        "yarn"
        # keep-sorted end
      ];
      files = {
        ".npmrc" = ''
          registry = https://registry.npmmirror.com
          coc.nvim:registry=https://registry.npmmirror.com/'';
      };
      tmpfiles = [ "d ${config.xdg.dataHome}/pnpm - - - - -" ];
      progs.fish.shellInit = ''
        set -x PNPM_HOME "$HOME/.local/share/pnpm"
        fish_add_path ~/.local/share/pnpm
      '';
    }
  )
)
