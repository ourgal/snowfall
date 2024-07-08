local naughty = require("naughty")
if _G.awesome.startup_errors then
  naughty.notify({preset = naughty.config.presets.critical, text = _G.awesome.startup_errors, title = "Oops, there were errors during startup!"})
else
end
local in_error = false
local function _2_(err)
  if in_error then
    return nil
  else
    in_error = true
    naughty.notify({preset = naughty.config.presets.critical, text = tostring(err), title = "Oops, an error happened!"})
    in_error = false
    return nil
  end
end
return _G.awesome.connect_signal("debug::error", _2_)
