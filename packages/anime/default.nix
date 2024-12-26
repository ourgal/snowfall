{
  viddy,
  transmission_4,
  pkgs,
  namespace,
  pog,
}:
pog.pog {
  name = "anime";
  version = "0.1.0";
  description = "A script for transmission cli";

  flags = [
    {
      name = "watch";
      description = "watch downloads";
      bool = true;
    }
    {
      name = "clear";
      description = "clear all downloads";
      bool = true;
    }
    {
      name = "delete";
      argument = "id";
      description = "delete download";
    }
    {
      name = "add";
      argument = "url";
      description = "add urls";
    }
    {
      name = "download_dir";
      short = "";
      default = "$HOME/Videos/anime";
      envVar = "ANIME_DOWNLOAD_DIR";
      argument = "dir";
      description = "download dir";
    }
  ];

  runtimeInputs = [
    viddy
    transmission_4
    pkgs.${namespace}.tewi
  ];

  script = ''
    if [[ $watch ]]; then
      viddy transmission-remote --list
    elif [[ $clear ]]; then
      ids=$(transmission-remote --list | awk 'NR > 1 && $1 != "Sum:" && $2 == "100%" {print $1}' | sed 's/\*//')
      for id in $ids; do
        transmission-remote -t "$id" -r
      done
    elif [[ $delete ]]; then
      transmission-remote -t "$delete" -r
    elif [[ $add ]]; then
      transmission-remote -w "$download_dir" --trash-torrent --add "$add"
    else
      tewi
    fi
  '';
}
