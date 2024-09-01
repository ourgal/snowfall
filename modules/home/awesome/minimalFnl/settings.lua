local host = nil
do
  local f = io.open("/etc/hostname")
  local function close_handlers_10_auto(ok_11_auto, ...)
    f:close()
    if ok_11_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _2_()
    host = f:read()
    return nil
  end
  close_handlers_10_auto(_G.xpcall(_2_, (package.loaded.fennel or debug).traceback))
end
local awful = require("awful")
local terminal = "wezterm"
local editor = (os.getenv("EDITOR") or "vim")
local browser = "firefox"
local browserS = "brave"
local browserSS = "qutebrowser"
local modkey = "Mod4"
local launcher = "rofi"
local launcher_cmd = (launcher .. " -show drun")
local playerctl = "playerctl"
local playerctl_cmd = ("playerctl" .. " play-pause")
local tag_num = 9
local suit = awful.layout.suit
local left_click = 1
local right_click = 3
return {
  tag_num = tag_num,
  host = host,
  terminal = terminal,
  editor = editor,
  editor_cmd = (terminal .. " -e " .. editor),
  launcher = launcher,
  launcher_cmd = launcher_cmd,
  playerctl = playerctl,
  playerctl_cmd = playerctl_cmd,
  modkey = modkey,
  browser = browser,
  browserS = browserS,
  browserSS = browserSS,
  layouts = { suit.spiral.dwindle, suit.max, suit.max.fullscreen },
  mappings = {
    client = {
      keys = {
        fullscreen = { modkey = { modkey }, key = "f", enable = true },
        close = { modkey = { modkey, "Shift" }, key = "c", enable = true },
        floating = { modkey = { modkey, "Control" }, key = "space", enable = true },
        master = { modkey = { modkey, "Control" }, key = "Return", enable = true },
        move_to_screen = { modkey = { modkey }, key = "o", enable = true },
        on_top = { modkey = { modkey }, key = "t", enable = true },
        minimize = { modkey = { modkey }, key = "n", enable = true },
        maximize = { modkey = { modkey }, key = "m", enable = true },
        maximize_vertical = { modkey = { modkey, "Control" }, key = "m", enable = true },
        maximize_horizontal = { modkey = { modkey, "Shift" }, key = "m", enable = true },
      },
      buttons = {
        focus = { modkey = {}, button = left_click, enable = true },
        move = { modkey = { modkey }, button = left_click, enable = true },
        resize = { modkey = { modkey }, button = right_click, enable = true },
      },
    },
    global = {
      keys = {
        focus_down = { modkey = { modkey }, key = "j", enable = true },
        focus_up = { modkey = { modkey }, key = "k", enable = true },
        focus_left = { modkey = { modkey }, key = "h", enable = true },
        focus_right = { modkey = { modkey }, key = "l", enable = true },
        show_help = { modkey = { modkey }, key = "s", enable = true },
        history_restore = { modkey = { modkey }, key = "Escape", enable = true },
        swap_next = { modkey = { modkey, "Shift" }, key = "j", enable = true },
        swap_prev = { modkey = { modkey, "Shift" }, key = "k", enable = true },
        focus_next = { modkey = { modkey, "Control" }, key = "j", enable = true },
        focus_prev = { modkey = { modkey, "Control" }, key = "k", enable = true },
        jump_urgent = { modkey = { modkey }, key = "u", enable = true },
        history_prev = { modkey = { modkey }, key = "Tab", enable = true },
        open_terminal = { modkey = { modkey }, key = "Return", enable = true },
        increase_master_client = { modkey = { modkey, "Shift" }, key = "h", enable = false },
        decrease_master_client = { modkey = { modkey, "Shift" }, key = "l", enable = false },
        increase_columns = { modkey = { modkey, "Control" }, key = "h", enable = false },
        decrease_columns = { modkey = { modkey, "Control" }, key = "l", enable = false },
        next_layout = { modkey = { modkey }, key = "space", enable = true },
        prev_layout = { modkey = { modkey, "Shift" }, key = "space", enable = true },
        restore_minimized = { modkey = { modkey, "Control" }, key = "n", enable = true },
        toggle_wibox = { modkey = { modkey }, key = "b", enable = true },
        app_launcher = { modkey = { modkey }, key = "d", enable = true },
        toggle_player = { modkey = { modkey }, key = "a", enable = true },
        awesome_restart = { modkey = { modkey, "Control" }, key = "r", enable = true },
        view_tag = { modkey = { modkey }, enable = true },
        toggle_tag = { modkey = { modkey, "Control" }, enable = true },
        move_focused_client_to_tag = { modkey = { modkey, "Shift" }, enable = true },
        toggle_focused_client_to_tag = { modkey = { modkey, "Control", "Shift" }, enable = true },
      },
    },
  },
}
