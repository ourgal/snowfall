-- https://github.com/jhawthorn/fzy/pull/116#issuecomment-538708329
local function fzy(a)
  local saved_spk = vim.o.splitkeep
  local src_winid = vim.fn.win_getid()
  -- lines >= 3 is a hardcoded limit in fzy
  local fzy_lines = (vim.v.count > 2 and vim.v.count) or 10
  local tempfile = vim.fn.tempname()
  local term_cmd = a.input .. " | fzy -l" .. fzy_lines .. " > " .. tempfile

  -- FIXME: terminal buffer shows in `:ls!` after exiting.
  local on_exit = function()
    vim.cmd.bwipeout()
    vim.o.splitkeep = saved_spk
    vim.fn.win_gotoid(src_winid)
    if vim.fn.filereadable(tempfile) then
      local lines = vim.fn.readfile(tempfile)
      if #lines > 0 then
        (a.action or vim.cmd.edit)(lines[1])
      end
    end
    vim.fn.delete(tempfile)
  end

  vim.o.splitkeep = "screen"
  vim.cmd("botright" .. (fzy_lines + 1) .. "new")
  -- NOTE: `cwd` can also be specified for the job
  local id = vim.fn.termopen(term_cmd, { on_exit = on_exit, env = a.env })
  vim.keymap.set("n", "<esc>", function()
    vim.fn.jobstop(id)
  end, { buffer = true })
  vim.cmd("keepalt file fzy")
  vim.cmd.startinsert()
end

local function fd()
  local inp = vim.fn.input("fd -H ")
  if #inp < 1 then
    return
  end
  fzy({ input = "fd -H " .. inp })
end

local function rg()
  local inp = vim.fn.input("rg --vimgrep ")
  if #inp < 1 then
    return
  end
  fzy({
    input = "rg --vimgrep " .. inp,
    action = function(line)
      local file, lnum, col = unpack(vim.split(line, ":"))
      vim.cmd.edit(file)
      vim.fn.cursor(lnum, col)
      vim.cmd("normal! zz")
    end,
  })
end

-- Mind the double quotes around env vars (do substitute, but without
-- wildcard expansions and word splitting).
local function buffers()
  fzy({
    env = { NVIM_BUFFERS = vim.fn.execute("ls") },
    input = 'echo "$NVIM_BUFFERS"',
    action = function(line)
      vim.cmd("b" .. string.match(line, "%d+"))
    end,
  })
end

-- TODO: echoed stuff disappears (should use g<)
local function history()
  local history = vim.fn.execute("history cmd")
  history = vim.split(history, "\n")
  for i = 1, #history do
    history[i] = history[i]:gsub(">?%s*%S+%s*", ":", 1)
  end
  history = table.concat(vim.fn.reverse(history), "\n")
  fzy({
    env = { NVIM_HISTORY = history },
    input = 'echo "$NVIM_HISTORY"', -- | tac | sed "s/>\\?\\s*\\S\\+\\s*/:/" ',
    action = function(line)
      vim.cmd(line:gsub(":", "", 1))
    end,
  })
end

local function oldfiles()
  fzy({
    env = { NVIM_OLDFILES = table.concat(vim.v.oldfiles, "\n") },
    input = 'echo "$NVIM_OLDFILES"',
  })
end

-- NOTE: getjumplist()
local function jumplist()
  local prepare_jumplist = function()
    jumps = vim.split(vim.fn.execute("jumps"), "\n", { trimempty = true })
    -- Find '>'.
    local current_pos = nil
    for n, line in ipairs(jumps) do
      if line:match("^%s*>") then
        current_pos = n
      end
    end
    -- Add +/- (newer/older) prefixes to lines (to be able to decide
    -- which key to use - <c-o>/<c-i> - on the selected item).
    for n, line in ipairs(jumps) do
      if n > 1 then
        local prefix = " "
        if n < current_pos then
          prefix = "-"
        end
        if n > current_pos then
          prefix = "+"
        end
        jumps[n] = line:gsub("%s", prefix, 1)
      end
    end
    -- Get rid of unneeded content (header, >), and reverse the list.
    local res = {}
    for i = #jumps, 1, -1 do
      if not jumps[i]:match("^%s*>") and jumps[i]:match("%d") then
        table.insert(res, jumps[i])
      end
    end
    return table.concat(res, "\n")
  end

  fzy({
    env = { NVIM_JUMPS = prepare_jumplist() },
    input = 'echo "$NVIM_JUMPS"',
    action = function(line)
      local n = line:match("%d+")
      local key = vim.api.nvim_replace_termcodes(line:match("^%s*%+") and "<c-i>" or "<c-o>", true, true, true)
      vim.fn.execute("normal! " .. n .. key)
    end,
  })
end

local function config()
  lvim.builtin.which_key.mappings["f"] = {}
  -- Usage:
  vim.keymap.set("n", "<leader>ff", function()
    require("configs.fzy").fd()
  end, { desc = "file", noremap = true })
  vim.keymap.set("n", "<leader>fg", function()
    require("configs.fzy").rg()
  end)
  vim.keymap.set("n", "<leader>fb", function()
    require("configs.fzy").buffers()
  end)
  vim.keymap.set("n", "<leader>fh", function()
    require("configs.fzy").history()
  end)
  vim.keymap.set("n", "<leader>fo", function()
    require("configs.fzy").oldfiles()
  end)
  vim.keymap.set("n", "<leader>fj", function()
    require("configs.fzy").jumplist()
  end)
end

return {
  fzy = fzy,
  fd = fd,
  rg = rg,
  buffers = buffers,
  history = history,
  oldfiles = oldfiles,
  jumplist = jumplist,
  config = config,
}
