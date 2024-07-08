{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        extraPlugins = with args.pkgs.vimPlugins; [
          headlines-nvim # Should load this in at the opening of filetypes that require this, namely Markdown.
        ];
        extraConfigLua = builtins.readFile ./config.lua;
      };
    };
  }
)
