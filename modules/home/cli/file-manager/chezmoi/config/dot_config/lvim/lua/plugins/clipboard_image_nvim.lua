return {
  "z775729168/clipboard-image.nvim",
  config = function()
    require("clipboard-image").setup({
      markdown = {
        img_dir = { "%:p:h", "assets" },
        img_dir_txt = { "assets" },
        img_handler = function(img) -- New feature from PR #22
          local avif = string.sub(img.path, 0, -4) .. "avif"
          local script1 = string.format('convert "%s" "%s"', img.path, avif)
          local script2 = string.format('rm "%s"', img.path)
          os.execute(script1)
          os.execute(script2)
        end,
      },
    })
  end,
  ft = "markdown",
  cmd = "PasteImg",
  enabled = lvim.user_plugins.language.markdown.paste.first,
}
