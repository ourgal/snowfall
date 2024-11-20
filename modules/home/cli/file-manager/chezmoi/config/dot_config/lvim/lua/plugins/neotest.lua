return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local namespace = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          return diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        end,
      },
    }, namespace)

    local opts = {
      running = {
        concurrent = false,
      },
      status = {
        virtual_text = true,
        signs = false,
      },
      strategies = {
        integrated = {
          width = 180,
        },
      },
      discovery = {
        enabled = true,
      },
      diagnostic = {
        enabled = true,
      },
      icons = {
        running = require("configs.lsp_kind").icons.clock,
      },
      floating = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      },
      adapters = {
        require("neotest-rust"),
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
        }),
        require("neotest-python")({
          dap = { justMyCode = false, console = "integratedTerminal" },
        }),
        require("neotest-plenary"),
      },
    }

    if lvim.user_plugins.edit.compile.overseer then
      opts.consumers = {
        overseer = require("neotest.consumers.overseer"),
      }
      opts.overseer = {
        enabled = true,
        force_default = true,
      }
    end

    require("neotest").setup(opts)
  end,
  keys = {
    {
      "<leader>tf",
      function()
        require("neotest").run.run({ vim.fn.expand("%"), env = require("plugins.neotest").get_env() })
      end,
      desc = "File",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, short = false })
      end,
      desc = "Output",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run({ env = require("plugins.neotest").get_env() })
      end,
      desc = "Run",
    },
    {
      "<leader>ta",
      function()
        require("plugins.neotest").run_all()
      end,
      desc = "Run All",
    },
    {
      "<leader>tc",
      function()
        require("plugins.neotest").cancel()
      end,
      desc = "Cancel",
    },
    {
      "<leader>tR",
      function()
        require("plugins.neotest").run_file_sync()
      end,
      desc = "Run Async",
    },
    {
      "<leader>ts",
      function()
        require("plugins.neotest").summary.toggle()
      end,
      desc = "Summary",
    },
    {
      "<leader>tn",
      function()
        require("plugins.neotest").jump.next({ status = "failed" })
      end,
      desc = "jump to next failed",
    },
    {
      "<leader>tp",
      function()
        require("plugins.neotest").jump.prev({ status = "failed" })
      end,
      desc = "jump to previous failed",
    },
    {
      "<leader>td",
      function()
        require("plugins.neotest").run.run({ strategy = "dap" })
      end,
      desc = "Dap Run",
    },
    {
      "<leader>tx",
      function()
        require("plugins.neotest").run.stop()
      end,
      desc = "Stop",
    },
    {
      "<leader>tw",
      function()
        require("plugins.neotest").watch.watch()
      end,
      desc = "Watch",
    },
  },
  enabled = lvim.user_plugins.edit.test,
}

-- local function get_env()
-- 	local env = {}
-- 	for _, file in ipairs({ ".env" }) do
-- 		if vim.fn.empty(vim.fn.glob(file)) ~= 0 then
-- 			break
-- 		end
--
-- 		for _, line in ipairs(vim.fn.readfile(file)) do
-- 			for name, value in string.gmatch(line, "(.+)=['\"]?(.*)['\"]?") do
-- 				local str_end = string.sub(value, -1, -1)
-- 				if str_end == "'" or str_end == '"' then
-- 					value = string.sub(value, 1, -2)
-- 				end
--
-- 				env[name] = value
-- 			end
-- 		end
-- 	end
-- 	return env
-- end

-- local function run_all()
-- 	local neotest = require("neotest")
-- 	if lvim.builtin.task_runner == "overseer" then
-- 		neotest.run.run(vim.fn.expand("%"))
-- 	else
-- 		for _, adapter_id in ipairs(neotest.run.adapters()) do
-- 			neotest.run.run({ suite = true, adapter = adapter_id })
-- 		end
-- 	end
-- end
--
-- M.cancel = function()
-- 	require("neotest").run.stop({ interactive = true })
-- end
--
-- M.run_file_sync = function()
-- 	require("neotest").run.run({ vim.fn.expand("%"), concurrent = false })
-- end
