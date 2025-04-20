{
  path = ./.;
  myPkgs = "focus-timer";
  confs."focus/config.yml" = {
    "auto_start_break" = true;
    "auto_start_work" = false;
    "break_sound" = "bell";
    "dark_theme" = true;
    "long_break_duration" = "15m";
    "long_break_interval" = 4;
    "long_break_msg" = "Take a long break";
    "notify" = true;
    "session_cmd" = "";
    "short_break_duration" = "5m";
    "short_break_msg" = "Take a breather";
    "sound" = "";
    "sound_on_break" = false;
    "strict" = false;
    "work_duration" = "25m";
    "work_msg" = "Focus on your task";
    "work_sound" = "loud_bell";
  };
}
