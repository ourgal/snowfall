{
  path = ./.;
  progs = {
    fish.interactiveShellInit = ''
      if test $fish_key_bindings = fish_vi_key_bindings
        bind --mode insert \cg 'gitui; commandline -f cancel'
      else
        bind \cg 'gitui; commandline -f cancel'
      end
    '';
    zsh.initExtra = ''
      __lazygit () { gitui; zle redisplay }
      zle -N __lazygit
      bindkey "^g" __lazygit
    '';
  };
}
