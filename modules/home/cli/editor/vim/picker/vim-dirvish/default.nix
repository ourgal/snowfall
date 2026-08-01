{
  progs.vim = {
    plugins = [
      "vim-dirvish"
      "vim-dirvish-dovish"
    ];
    extraConfig = ./config.vim;
  };
  confs."vim/ftplugin/dirvish.vim" = ''
    nnoremap <buffer> l <CR>
    nnoremap <buffer> h -
  '';
}
