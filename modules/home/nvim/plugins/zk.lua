return {
  "zk-org/zk-nvim",
  name = "zk",
  keys = {
    { "<leader>zn", "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", desc = "New note" },
    { "<leader>zo", "<cmd>ZkNotes { sort = { 'modified' } }<cr>",         desc = "Open notes" },
    { "<leader>zt", "<cmd>ZkTags<cr>",                                    desc = "Tags" },
    { "<leader>zf", "<cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>", desc = "Search notes" },
    { "<leader>zf", ":'<,'>ZkMatch<cr>",                                  desc = "Match selection", mode = "v" },
    { "<leader>zb", "<cmd>ZkBacklinks<cr>",                               desc = "Backlinks" },
    { "<leader>zl", "<cmd>ZkLinks<cr>",                                   desc = "Links" },
    { "<leader>zi", "<cmd>ZkIndex<cr>",                                   desc = "Index notebook" },
  },
  opts = {
    picker = "snacks_picker",
    lsp = {
      config = {
        name = "zk",
        cmd = { "zk", "lsp" },
        filetypes = { "markdown" },
      },
      auto_attach = {
        enabled = true,
      },
    },
  },
}
