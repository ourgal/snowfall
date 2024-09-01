local gears = require("gears")
local settings = require("settings")
local join = gears.table.join
local keys = require((... .. "/keys"))
local bind_key
local function _1_(_241)
  local s = settings.mappings.global.keys[_241]
  if s.enable == true then
    return keys[_241](s.modkey, s.key)
  else
    return nil
  end
end
bind_key = _1_
local bind_key_loop
local function _3_(_241, _242)
  local s = settings.mappings.global.keys[_241]
  if s.enable == true then
    return keys[_241](s.modkey, _242)
  else
    return nil
  end
end
bind_key_loop = _3_
local globalkeys = {}
globalkeys = join(
  bind_key("focus_down"),
  bind_key("focus_up"),
  bind_key("focus_left"),
  bind_key("focus_right"),
  bind_key("show_help"),
  bind_key("history_restore"),
  bind_key("swap_next"),
  bind_key("swap_prev"),
  bind_key("focus_next"),
  bind_key("focus_prev"),
  bind_key("jump_urgent"),
  bind_key("history_prev"),
  bind_key("open_terminal"),
  bind_key("increase_master_client"),
  bind_key("decrease_master_client"),
  bind_key("increase_columns"),
  bind_key("decrease_columns"),
  bind_key("next_layout"),
  bind_key("prev_layout"),
  bind_key("restore_minimized"),
  bind_key("toggle_wibox"),
  bind_key("app_launcher"),
  bind_key("toggle_player"),
  bind_key("awesome_restart")
)
for i = 1, settings.tag_num do
  globalkeys = join(
    globalkeys,
    bind_key_loop("view_tag", i),
    bind_key_loop("toggle_tag", i),
    bind_key_loop("move_focused_client_to_tag", i),
    bind_key_loop("toggle_focused_client_to_tag", i)
  )
end
return _G.root.keys(globalkeys)
