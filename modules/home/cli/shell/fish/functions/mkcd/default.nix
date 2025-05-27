{
  progs.fish.functions.mkcd = {
    description = "mkdir and cd";
    body = ''
      set -l options (fish_opt -s h -l help)
      set options $options (fish_opt -s c -l clip)
      set options $options (fish_opt -s C -l copy)
      set options $options (fish_opt -s p -l parent)
      set options $options (fish_opt -s a -l increase)
      set options $options (fish_opt -s x -l decrease)
      argparse $options -- $argv

      if set -q _flag_help
        echo "Usage: mkcd "(set_color yellow)"[OPTIONS]"(set_color normal)" "(set_color blue)"[DIR]"(set_color normal)""
        echo
        echo "Options:"
        echo "  "(set_color yellow)"-c"(set_color normal)", "(set_color yellow)"--clip"(set_color normal)"       Read clipboard"
        echo "  "(set_color yellow)"-C"(set_color normal)", "(set_color yellow)"--copy"(set_color normal)"       Copy files"
        echo "  "(set_color yellow)"-p"(set_color normal)", "(set_color yellow)"--parent"(set_color normal)"     Parent dir"
        echo "  "(set_color yellow)"-a"(set_color normal)", "(set_color yellow)"--increase"(set_color normal)"   Increase number"
        echo "  "(set_color yellow)"-x"(set_color normal)", "(set_color yellow)"--decrease"(set_color normal)"   Decrease number"
        echo "  "(set_color yellow)"-h"(set_color normal)", "(set_color yellow)"--help"(set_color normal)"       Help"
        return
      end

      test -z $argv[1] && set dir (basename (pwd)) || set dir $argv[1]

      set -q _flag_clip && set dir (xclip -o -sel clip)

      set -q _flag_increase && set dir (echo $dir | perl -pe 's/(\d+)/$1+1/eg' )
      set -q _flag_decrease && set dir (echo $dir | perl -pe 's/(\d+)/$1-1/eg' )

      set -q _flag_copy && xclip-copyfile .

      set -q _flag_parent && set dir "../$dir"

      test -n $dir && mkdir -p $dir && cd $dir && set -q _flag_copy && xclip-pastefile
    '';
  };
}
