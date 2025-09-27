args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      cfg = config.${namespace}.cli.editor.vim;
      baseConfig = builtins.readFile ./config.vim;
      carbonConfig =
        if cfg.integration.vim-carbon-now-sh.enable then
          ''
            let g:which_key_map[',']['s']['c'] = ['ggVG:CarbonNowSh', 'Carbon']
            let g:which_key_map_visual[',']['s']['c'] = ['gv:CarbonNowSh', 'Carbon']
          ''
        else
          "";
      floatermConfig =
        if cfg.integration.vim-floaterm.enable then
          ''
            let g:which_key_map['f']['f'] = [':FloatermNew broot', 'Broot']
            let g:which_key_map[' '] = [':FloatermNew broot', 'Broot']
            let g:which_key_map['e'] = [':FloatermNew lf', 'Lf']
          ''
        else
          "";
      siliconConfig =
        if cfg.integration.vim-silicon.enable then
          ''
            let g:which_key_map[',']['s']['s'] = [':Silicon', 'Silicon']
            let g:which_key_map_visual[',']['s']['s'] = ['gv:Silicon', 'Silicon']
          ''
        else
          "";
      bufexplorerConfig =
        if cfg.picker.bufexplorer.enable then
          ''
            let g:which_key_map['b']['e'] = [ ':BufExplorer', 'Explorer' ]
            let g:which_key_map['b']['t'] = [ 'ToggleBufExplorer', 'Toggle explorer' ]
            let g:which_key_map['b']['s'] = [ 'BufExplorerHorizontalSplit', 'Explorer split' ]
            let g:which_key_map['b']['v'] = [ 'BufExplorerVerticalSplit', 'Explorer vsplit' ]
          ''
        else
          "";
      ctrlpConfig =
        if cfg.picker.ctrlp-vim.enable then
          ''
            let g:which_key_map['f'][' '] = [':CtrlP', 'CtrlP']
          ''
        else
          "";
      fzfConfig =
        if cfg.picker.fzf-vim.enable then
          ''
            let g:which_key_map['f']['g'] = [':GFiles?', 'Git Files Modified']
            let g:which_key_map['f']['F'] = [':Files', 'Files']
            let g:which_key_map['f']['b'] = [':Buffers', 'Buffers']
            let g:which_key_map['b']['f'] = [':Buffers', 'Buffers']
            let g:which_key_map['s']['f'] = [':GFiles?', 'Git files']
            let g:which_key_map['s']['/'] = [':History/', 'Search history']
            let g:which_key_map['s'][':'] = [':History:', 'Command history']
            let g:which_key_map['s']['K'] = [':Maps', 'Keymaps']
            let g:which_key_map['s']['C'] = [':Commands', 'Commands']
            let g:which_key_map['g']['h'] = [':BCommits', 'Commit history']
            let g:which_key_map['/'] = [':RG', 'Live grep']
          ''
        else
          "";
      fugitiveConfig =
        if cfg.git.vim-fugitive.enable then
          ''
            let g:which_key_map['g']['g'] = [':tab G', 'Fugitive']
          ''
        else
          "";
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-which-key ];
        extraConfig = builtins.concatStringsSep "" [
          baseConfig
          carbonConfig
          floatermConfig
          siliconConfig
          bufexplorerConfig
          ctrlpConfig
          fzfConfig
          fugitiveConfig
        ];
      };
    }
  )
)
