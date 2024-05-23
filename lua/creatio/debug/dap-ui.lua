return{
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },

  config = function()
    require("nvim-dap-virtual-text").setup()
    local dap, dapui = require("dap"), require("dapui")

    vim.keymap.set("n", "<space>?", function()
      dapui.eval(nil, {enter = true})
    end)

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end
}
