{
  progs.vim = {
    plugins = [
      "vim-dirvish"
      "vim-dirvish-dovish"
    ];
    extraConfig = ./config.vim;
  };
  confs."vim/ftplugin/dirvish.vim" = ''
    nmap <buffer> l <CR>
    nmap <buffer> h -
  '';
}
