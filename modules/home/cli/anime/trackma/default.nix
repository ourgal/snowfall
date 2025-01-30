args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "inotify-tools"
        "trackma-curses"
        # keep-sorted end
      ];
      confs = {
        "trackma/config.json" = {
          auto_date_change = true;
          auto_status_change = true;
          auto_status_change_if_scored = true;
          autoretrieve = "days";
          autoretrieve_days = 3;
          autosend = "minutes";
          autosend_at_exit = true;
          autosend_minutes = 60;
          autosend_size = 5;
          debug_disable_lock = true;
          jellyfin_api_key = "";
          jellyfin_host = "localhost";
          jellyfin_port = "8096";
          jellyfin_user = "";
          kodi_host = "localhost";
          kodi_obey_update_wait_s = false;
          kodi_passwd = "";
          kodi_port = "8080";
          kodi_user = "";
          library_autoscan = true;
          library_full_path = false;
          player = "mpv";
          plex_host = "localhost";
          plex_obey_update_wait_s = false;
          plex_passwd = "";
          plex_port = "32400";
          plex_ssl = false;
          plex_user = "";
          plex_uuid = "4fd8d779-1f67-11ef-9af3-08bfb888ec3a";
          redirections_time = 1;
          redirections_url = "https://raw.githubusercontent.com/erengy/anime-relations/master/anime-relations.txt";
          scan_whole_list = false;
          searchdir = [ "/mnt/nfs/anime" ];
          tracker_enabled = true;
          tracker_ignore_not_next = true;
          tracker_interval = 10;
          tracker_not_found_prompt = false;
          tracker_process = "mplayer|mplayer2|mpv";
          tracker_type = "auto";
          tracker_update_close = false;
          tracker_update_prompt = false;
          tracker_update_wait_s = 1200;
          use_hooks = true;
        };
      };
      progs.fish.shellAbbrs.tmc = "trackma-curses";
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          tmc = "trackma-curses";
        };
      };
    }
  )
)
