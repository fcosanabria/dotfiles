return {
  {
    "nvim-neorg/neorg",
    version = "*",
    lazy = false,
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Notes/neorg",
            },
            default_workspace = "notes",
          },
        },
      },
    },
    config = function(_, opts)
      require("neorg").setup(opts)
    end,
    keys = {
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Neorg Index" },
      { "<leader>nw", "<cmd>Neorg workspace notes<cr>", desc = "Neorg Workspace" },
      { "<leader>nn", "<cmd>Neorg workspace<cr>", desc = "Neorg Workspaces" },
    },
  },
}
