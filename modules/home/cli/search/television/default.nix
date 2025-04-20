{
  path = ./.;
  nixPkgs = "television";
  confs."television/config.toml" = {
    ui = {
      use_nerd_font_icons = false;
      ui_scale = 90;
    };
  };
}
