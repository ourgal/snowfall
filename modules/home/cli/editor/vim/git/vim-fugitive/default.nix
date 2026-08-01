{
  progs.vim = {
    plugins = "vim-fugitive";
  };
  confs."vim/ftplugin/fugitive.vim" = ''
    nnoremap <buffer> q <cmd>q<cr>
    nmap <buffer> <tab> =
    xmap <buffer> <tab> =
  '';
  confs."vim/ftplugin/gitcommit.vim" = ''
    autocmd BufEnter <buffer> silent wincmd L
  '';
}
