local ss_index = nil
do
  local fs = require("gears.filesystem")
  local dir = fs.get_configuration_dir()
  local file = (dir .. "ss_index.txt")
  if fs.file_readable(file) then
    local f = io.open(file)
    local function close_handlers_10_auto(ok_11_auto, ...)
      f:close()
      if ok_11_auto then
        return ...
      else
        return error(..., 0)
      end
    end
    local function _2_()
      ss_index = f:read()
      return nil
    end
    close_handlers_10_auto(_G.xpcall(_2_, (package.loaded.fennel or debug).traceback))
  else
    local f = io.open(file, "w")
    local function close_handlers_10_auto(ok_11_auto, ...)
      f:close()
      if ok_11_auto then
        return ...
      else
        return error(..., 0)
      end
    end
    local function _4_()
      return f:write(1)
    end
    close_handlers_10_auto(_G.xpcall(_4_, (package.loaded.fennel or debug).traceback))
  end
end
return { ss_index = ss_index }
