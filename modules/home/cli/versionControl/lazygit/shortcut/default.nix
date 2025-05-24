{
  progs = {
    fish.interactiveShellInit = ''
      if test $fish_key_bindings = fish_vi_key_bindings
        bind --mode insert \cg 'lazygit; commandline -f cancel'
      else
        bind \cg 'lazygit; commandline -f cancel'
      end
    '';
    zsh.initContent = ''
      __lazygit () { lazygit; zle redisplay }
      zle -N __lazygit
      bindkey "^g" __lazygit
    '';
  };
}
