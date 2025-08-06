{
  nixPkgs = "topydo";
  confs."topydo/config" = ''
    [aliases]
    a = add
    d = do
    q = quit

    [column_keymap]
    q = cmd quit

    [colorscheme]
    focus_background_color = yellow
  '';
}
