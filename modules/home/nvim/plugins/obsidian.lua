return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  keys = {
    -- Navigation / switching
    { "<leader>of", "<cmd>Obsidian quick_switch<cr>",       desc = "Find note" },
    { "<leader>os", "<cmd>Obsidian search<cr>",             desc = "Search notes" },
    { "<leader>ow", "<cmd>Obsidian workspace<cr>",          desc = "Switch workspace" },
    -- Creation
    { "<leader>on", "<cmd>Obsidian new<cr>",                desc = "New note" },
    { "<leader>oN", "<cmd>Obsidian new_from_template<cr>",  desc = "New from template" },
    { "<leader>ou", "<cmd>Obsidian unique_note<cr>",        desc = "New unique note" },
    -- Daily notes
    { "<leader>od", "<cmd>Obsidian today<cr>",              desc = "Today" },
    { "<leader>oD", "<cmd>Obsidian dailies<cr>",            desc = "Dailies picker" },
    { "<leader>o]", "<cmd>Obsidian tomorrow<cr>",           desc = "Tomorrow" },
    { "<leader>o[", "<cmd>Obsidian yesterday<cr>",          desc = "Yesterday" },
    -- Current note
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>",          desc = "Backlinks" },
    { "<leader>ol", "<cmd>Obsidian links<cr>",              desc = "Links in note" },
    { "<leader>oc", "<cmd>Obsidian toc<cr>",                desc = "Table of contents" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>",               desc = "Tags" },
    { "<leader>oi", "<cmd>Obsidian template<cr>",           desc = "Insert template" },
    { "<leader>op", "<cmd>Obsidian paste_img<cr>",          desc = "Paste image" },
    { "<leader>or", "<cmd>Obsidian rename<cr>",             desc = "Rename note" },
    { "<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>",    desc = "Toggle checkbox" },
    { "<leader>oF", "<cmd>Obsidian follow_link<cr>",        desc = "Follow link" },
    -- Open in app
    { "<leader>oo", "<cmd>Obsidian open<cr>",               desc = "Open in app" },
    -- Visual mode
    { "<leader>oe", "<cmd>Obsidian extract_note<cr>",       desc = "Extract to note",   mode = "v" },
    { "<leader>ok", "<cmd>Obsidian link<cr>",               desc = "Link selection",     mode = "v" },
    { "<leader>oK", "<cmd>Obsidian link_new<cr>",           desc = "Link to new note",   mode = "v" },
  },
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    note_id_func = function(title)
      local slug = require("obsidian.builtin").title_id(title)
      return os.date("%Y-%m-%d") .. "-" .. slug
    end,
    daily_notes = {
      folder = "daily-notes",
    },
    workspaces = {
      {
        name = "personal",
        path = "~/Notes/",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  },
}
