return {
  "rcarriga/nvim-dap-ui",
  opts = function(_, opts)
    local dap = require("dap")
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil
  end,
}
