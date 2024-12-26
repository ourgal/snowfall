{
  pog,
  xclip,
  aria2,
  ...
}:
pog.pog {
  name = "dirdl";
  version = "0.1.0";
  description = "download in sub dir";

  flags = [
    {
      name = "clip";
      description = "generate urls.txt from clipboard";
      bool = true;
    }
    {
      name = "dir";
      short = "";
      default = ".";
      argument = "dir";
      description = "download dir";
    }
  ];

  runtimeInputs = [
    xclip
    aria2
  ];

  script = ''
    function clipboard2urls {
      mkdir -p "$dir"
      xclip -o -sel clip > "$dir/urls.txt"
    }

    if [[ $clip ]]; then
      clipboard2urls
      exit
    fi

    find . -type d -execdir bash -c 'cd "$1" && test -e urls.txt && aria2c --input-file urls.txt && rm urls.txt' shell {} \;
  '';
}
