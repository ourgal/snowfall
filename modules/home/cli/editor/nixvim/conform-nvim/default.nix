{
  path = ./.;
  progs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 5000;
        lsp_fallback = true;
      };
      formatters_by_ft = {
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        lua = [ "stylua" ];
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
}
