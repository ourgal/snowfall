args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      inherit (builtins) readFile;
    in
    {
      path = ./.;
      progs.nixvim = {
        extraPlugins = with pkgs.vimPlugins; [
          headlines-nvim # Should load this in at the opening of filetypes that require this, namely Markdown.
        ];
        extraConfigLua = readFile ./config.lua;
      };
    }
  )
)
