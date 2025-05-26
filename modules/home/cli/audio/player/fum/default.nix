{
  nixPkgs = "fum";
  confs."fum/config.jsonc" = {
    players = [ "mpd" ];
    use_active_player = true;
  };
}
