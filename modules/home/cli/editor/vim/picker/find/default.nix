{
  progs.vim.extraConfig = ''
    import '~/.config/vim/import/find.vim'
    nnoremap <leader><space> :find<space>
  '';
  confs."vim/import/find.vim" = ''
    vim9script

    # simple fuzzy find finder
    # place into ~/.vim/plugin/fuzzyfind.vim

    set wildmode=noselect:lastused,full
    set wildmenu wildoptions=pum,fuzzy pumheight=12


    var files_cache: list<string> = []
    augroup CmdComplete
        au!
        au CmdlineChanged : wildtrigger()
        au CmdlineEnter : files_cache = []
    augroup END

    def FindCmd(): string
        var cmd = '''
        if executable('fd')
            cmd = 'fd . --path-separator / --type f --hidden --follow --exclude .git'
        elseif executable('fdfind')
            cmd = 'fdfind . --path-separator / --type f --hidden --follow --exclude .git'
        elseif executable('ugrep')
            cmd = 'ugrep "" -Rl -I --ignore-files'
        elseif executable('rg')
            cmd = 'rg --path-separator / --files --hidden --glob !.git'
        elseif executable('find')
            cmd = 'find \! \( -path "*/.git" -prune -o -name "*.swp" \) -type f -follow'
        endif
        return cmd
    enddef

    def Find(cmd_arg: string, cmd_complete: bool): list<string>
        if empty(files_cache)
            var cmd = FindCmd()
            # fallback to built-in glob if no fd/rg/ug/find is available
            # e.g. we are on Windows
            if empty(cmd)
                files_cache = globpath('.', '**', 1, 1)
                    ->filter((_, v) => !isdirectory(v))
                    ->mapnew((_, v) => v->substitute('^\.[\/]', "", ""))
            else
                files_cache = systemlist(cmd)
            endif
        endif
        if empty(cmd_arg)
            return files_cache
        else
            return files_cache->matchfuzzy(cmd_arg)
        endif
    enddef

    set findfunc=Find
  '';
}
