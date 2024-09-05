local core = require("core")
local keymap = require("core.keymap")
local config = require("core.config")
local style = require("core.style")
local home = os.getenv("HOME")
style.code_font =
  renderer.font.load(home .. "/.nix-profile/share/fonts/truetype/NerdFonts/FiraCodeNerdFont-Regular.ttf", 14 * SCALE)

config.user_nmap = {
  ["H"] = "root:switch-to-previous-tab",
  ["L"] = "root:switch-to-next-tab",
  ["X"] = "root:close",
}

config.vibe_starting_mode = "normal"
