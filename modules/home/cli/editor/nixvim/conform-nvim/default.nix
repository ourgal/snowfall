{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          conform-nvim = {
            enable = true;
            formatOnSave = {
              timeoutMs = 5000;
              lspFallback = true;
            };
            formattersByFt = {
              lua = [ "stylua" ];
              # Conform will run multiple formatters sequentially
              python = [
                "ruff_fix"
                "ruff_format"
              ];
              markdown = [
                "mdformat"
                "autocorrect"
              ];
              text = [ "autocorrect" ];
              fish = [ "fish_indent" ];
              html = [ "perttier" ];
              sh = [ "shfmt" ];
              yaml = [ "yamlfmt" ];
              json = [ "fixjson" ];
              nix = [ "nixfmt" ];
              zig = [ "zigfmt" ];
            };
          };
        };
      };
    };
  }
)
