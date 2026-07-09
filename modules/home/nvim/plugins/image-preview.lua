return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
              use_snacks_image = true,
              title = "Neo-tree Preview",
            },
          },
        },
      },
    },
  },
}
