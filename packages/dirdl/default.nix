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

  script =
    helpers: with helpers; ''
      clipboard2urls() {
        mkdir -p "$dir"
        xclip -o -sel clip > "$dir/urls.txt"
      }

      if ${flag "clip"}; then
        clipboard2urls
        exit
      fi

      find . -type d -execdir bash -c 'cd "$1" && test -e urls.txt && aria2c --input-file urls.txt -j 1 && rm urls.txt' shell {} \;
    '';
}