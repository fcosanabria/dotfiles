-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_user_command("Messages", function()
  local output = vim.api.nvim_exec2("messages", { output = true }).output
  local lines = vim.split(output, "\n", { plain = true })
  local buf = vim.api.nvim_create_buf(false, true)

  if #lines == 0 or (#lines == 1 and lines[1] == "") then
    lines = { "No messages." }
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "log"
  vim.bo[buf].modifiable = false

  vim.cmd("botright split")
  vim.api.nvim_win_set_buf(0, buf)
end, { desc = "Open :messages in split" })

vim.keymap.set("n", "<leader>um", "<cmd>Messages<cr>", { desc = "Messages Buffer" })
