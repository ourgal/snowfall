{
  progs.vim = {
    plugins = "vim-templates";
    extraConfig = ./config.vim;
  };
  confs = {
    "vim/templates/linovel.template" = ''
      {
        "0": {
          "0": "",
          "img": ""
        }
      }
    '';
    "vim/templates/cpp.template" = ''
      #include <iostream>
      using namespace std;

      int main()
      {
        return 0;
      }
    '';
    "vim/templates/pl.template" = ''
      #!/usr/bin/env perl

      use utf8;
      use warnings;
      use v5.38;
      use autodie;
      use open qw( :std :encoding(UTF-8) );
    '';
  };
}
