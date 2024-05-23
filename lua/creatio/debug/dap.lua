return{
  "mfussenegger/nvim-dap",
  event = "BufEnter",


  config = function()
    vim.keymap.set("n", "db", "<cmd>DapToggleBreakpoint<cr>")
    vim.keymap.set("n", "dr", "<cmd>DapContinue<cr>")

    local dap = require("dap")
    dap.adapters.cppdbg = {
      type = "executable",
      command = "/home/creatio/.local/share/nvim/mason/bin/OpenDebugAD7",
      id = "cppdbg",
    }

    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode-14",
      name = "lldb",
    }

    dap.adapters.coreclr = {
      type = "executable",
      command = "/home/creatio/.local/share/nvim/mason/bin/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    -- lldb is install using sudo apt command and not from mason
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/target/debug/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = { "--interpreter=vscode" },
        runInTerminal = true,
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        -- MIMode = "gdb",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",

        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
        stopOnEntry = true,
        -- args = {},
        -- runInTerminal = false,
        -- program = "main",
      },
      {
        name = "Attach to gdbserver: 1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/net7.0/", "file")
        end,
      },
    }
  end

}
