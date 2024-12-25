{
  pog,
  xclip,
  perl,
  ...
}:
pog.pog {
  name = "mkcd";
  version = "0.1.0";
  description = "mkdir and cd";

  flags = [
    {
      name = "clip";
      description = "clipboard";
      bool = true;
    }
    {
      name = "copy";
      short = "C";
      description = "copy files";
      bool = true;
    }
    {
      name = "increase";
      short = "a";
      description = "increase number";
      bool = true;
    }
    {
      name = "decrease";
      short = "x";
      description = "decrease number";
      bool = true;
    }
    {
      name = "parent";
      description = "create parent dir";
      bool = true;
    }
    {
      name = "dir";
      short = "";
      default = "";
      argument = "dir";
      description = "target dir";
    }
  ];

  runtimeInputs = [
    xclip
    perl
  ];

  script = ''
    [[ $dir ]] || dir=$(basename "$(pwd)")

    [[ $clip ]] && dir=$(xclip -o -sel clip)

    [[ $increase ]] && dir=$(echo "$dir" | perl -pe 's/(\d+)/$1+1/eg' )
    [[ $decrease ]] && dir=$(echo "$dir" | perl -pe 's/(\d+)/$1-1/eg' )

    [[ $copy ]] && xclip-copyfile .

    [[ $parent ]] && dir="../$dir"

    [[ $dir ]] && mkdir -p "$dir" && \cd "$dir" && [[ $copy ]] && xclip-pastefile
  '';
}
