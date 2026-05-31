return {
  {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker", -- Using the darkest variant of teide
      light_style = "darker", -- Use darker even when background is light
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      dim_inactive = false,
      lualine_bold = false,
    },
    config = function(_, opts)
      require("teide").setup(opts)
      vim.cmd.colorscheme("teide-darker")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "teide-darker",
    },
  },
}
